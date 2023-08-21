package com.ark.center.iam.application.role.event;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.client.user.common.UserMqInfo;
import com.ark.center.iam.client.user.dto.UserApiPermissionChangedDTO;
import com.ark.center.iam.client.user.dto.UserApiPermissionDTO;
import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.gateway.ApiGateway;
import com.ark.center.iam.domain.permission.Permission;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.gateway.PermissionGateway;
import com.ark.center.iam.domain.role.gateway.RoleGateway;
import com.ark.center.iam.domain.user.User;
import com.ark.center.iam.domain.user.gateway.UserGateway;
import com.ark.component.mq.MsgBody;
import com.ark.component.mq.integration.MessageTemplate;
import com.ark.component.orm.mybatis.base.BaseEntity;
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
    private final RoleGateway roleGateway;
    private final UserGateway userGateway;
    private final ApiGateway apiGateway;
    private final PermissionGateway permissionGateway;
    private final MessageTemplate messageTemplate;

    public void onApplicationEvent(@NotNull RolePermissionChangedEvent event) {
        log.info("角色权限发生变更: Event = {}, ", event);
        Long roleId = event.getRoleId();
        // 查询角色最新的Api权限
        List<Api> apis = queryRoleApis(event);
        // 写入缓存
        cache(roleId, apis);
        // 推送变更MQ消息
        publishMQ(roleId, apis);
    }

    private void publishMQ(Long roleId, List<Api> apis) {
        List<User> users = userGateway.selectByRoleId(roleId);
        for (User user : users) {
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
            messageTemplate.asyncSend(UserMqInfo.TOPIC_IAM, UserMqInfo.TAG_USER_API_PERMS, MsgBody.of(dto));
        }
        log.info("角色权限发生变更: 消息推送成功");
    }

    private void cache(Long roleId, List<Api> apis) {
        try {
            roleGateway.saveRoleApiPermissionCache(roleId, apis);
            log.info("角色权限发生变更: 缓存写入成功");
        } catch (Exception e) {
            log.error("角色权限发生变更: 缓存写入失败", e);
            throw new RuntimeException(e);
        }
    }

    private List<Api> queryRoleApis(@NotNull RolePermissionChangedEvent event) {
        Long roleId = event.getRoleId();
        List<Permission> permissions = permissionGateway.selectByTypeAndRoleIds(Lists.newArrayList(roleId), PermissionType.SER_API.getType());
        if (CollectionUtil.isNotEmpty(permissions)) {
            List<Long> permissionIds = permissions.stream().map(BaseEntity::getId).toList();
            return apiGateway.selectByIds(permissionIds);
        }
        return Collections.emptyList();
    }

}
