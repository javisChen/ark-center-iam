package com.ark.center.iam.application.role.event;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.client.IamMQConst;
import com.ark.center.iam.client.user.dto.UserApiPermissionChangedDTO;
import com.ark.center.iam.client.user.dto.UserApiPermissionDTO;
import com.ark.center.iam.infra.api.Api;
import com.ark.center.iam.infra.api.service.ApiService;
import com.ark.center.iam.infra.permission.Permission;
import com.ark.center.iam.infra.permission.enums.PermissionType;
import com.ark.center.iam.infra.permission.gateway.impl.PermissionService;
import com.ark.center.iam.infra.role.service.RoleService;
import com.ark.center.iam.infra.user.User;
import com.ark.center.iam.infra.user.common.UserCacheKey;
import com.ark.center.iam.infra.user.service.UserService;
import com.ark.component.cache.CacheService;
import com.ark.component.mq.MsgBody;
import com.ark.component.mq.integration.MessageTemplate;
import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.List;

/**
 * 角色API权限变更事件监听器
 * @author JC
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class RolePermissionEventListener implements ApplicationListener<RolePermissionChangedEvent> {

    private final RoleService roleService;
    private final UserService userService;
    private final ApiService apiService;
    private final PermissionService permissionGateway;
    private final MessageTemplate messageTemplate;
    private final CacheService cacheService;

    public void onApplicationEvent(@NotNull RolePermissionChangedEvent event) {
        log.info("角色权限发生变更: Event = {}, ", event);
        Long roleId = event.getRoleId();
        // 查询角色最新的Api权限
        List<Api> apis = queryRoleApis(event);
        // 写入缓存
        cache(roleId, apis);
        // 查询所有绑定该角色用户
        List<User> users = userService.selectByRoleId(roleId);
        // todo 暂时不考虑性能和并发修改问题，后续优化
        for (User user : users) {
            // 发布权限变更消息
            publishPermissionChangedEvents(user, apis);
            // 清除用户维度的缓存数据
            invalidateUserCache(user, event);
        }
    }

    private void invalidateUserCache(User user, RolePermissionChangedEvent event) {
        Long userId = user.getId();
        if (event.getPermissionType().equals(PermissionType.FRONT_ROUTE)) {
            // 清除用户页面元素缓存
            cacheService.del(String.format(UserCacheKey.CACHE_KEY_USER_ELEMS, userId));
            // 清除用户路由缓存
            cacheService.del(String.format(UserCacheKey.CACHE_KEY_USER_ROUTES, userId));
        }
    }

    private void publishPermissionChangedEvents(User user, List<Api> apis) {
            UserApiPermissionChangedDTO dto = new UserApiPermissionChangedDTO();
            dto.setUserId(user.getId());
            dto.setApiPermissions(apis.stream()
                    .map(item -> {
                        UserApiPermissionDTO permissionDTO = new UserApiPermissionDTO();
                        permissionDTO.setMethod(item.getMethod());
                        permissionDTO.setUri(item.getUri());
                        return permissionDTO;
                    })
                    .toList());
            messageTemplate.asyncSend(IamMQConst.TOPIC_IAM, IamMQConst.TAG_USER_API_PERMS, MsgBody.of(dto));
    }

    private void cache(Long roleId, List<Api> apis) {
        try {
            roleService.saveRoleApiPermissionCache(roleId, apis);
            log.info("角色权限发生变更: 缓存写入成功");
        } catch (Exception e) {
            log.error("角色权限发生变更: 缓存写入失败", e);
            throw new RuntimeException(e);
        }
    }

    private List<Api> queryRoleApis(@NotNull RolePermissionChangedEvent event) {
        Long roleId = event.getRoleId();
        List<Permission> permissions = permissionGateway.selectByTypeAndRoleIds(Lists.newArrayList(roleId), PermissionType.SER_API);
        if (CollectionUtil.isNotEmpty(permissions)) {
            List<Long> permissionIds = permissions.stream().map(Permission::getResourceId).toList();
            return apiService.selectByIds(permissionIds);
        }
        return Collections.emptyList();
    }

}
