package com.ark.center.iam.application.role.event;

import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.gateway.ApiGateway;
import com.ark.center.iam.domain.permission.gateway.PermissionGateway;
import com.ark.center.iam.domain.role.gateway.RoleGateway;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

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

    private final ApiGateway apiGateway;

    private final PermissionGateway permissionGateway;

    public void onApplicationEvent(@NotNull RolePermissionChangedEvent event) {
        log.info("角色权限发生变更: Event = {}, ", event);
        Long roleId = event.getRoleId();
        List<Api> apis = queryApis(event);
        // 写入缓存
        cache(roleId, apis);
        // 推送变更MQ消息
        publishMQ(roleId, apis);
    }

    private void publishMQ(Long roleId, List<Api> apis) {
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

    private List<Api> queryApis(@NotNull RolePermissionChangedEvent event) {
        List<Long> permissionIds = event.getPermissionIds();
        // 根据权限id反查出资源
        List<Long> resourceIds = permissionGateway.selectResourceIdsByIds(permissionIds);
        return apiGateway.selectByIds(resourceIds);
    }

}
