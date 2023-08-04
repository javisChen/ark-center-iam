package com.ark.center.iam.application.user.executor;

import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.permission.Permission;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.route.gateway.RouteGateway;
import com.ark.center.iam.domain.user.service.UserPermissionService;
import com.ark.center.iam.infra.permission.assembler.PermissionAssembler;
import com.ark.component.context.core.ServiceContext;
import com.ark.component.security.base.user.LoginUser;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Objects;

@Component
@RequiredArgsConstructor
public class UserSelfQryExe {

    private final UserPermissionService userPermissionService;
    private final RouteGateway routeGateway;
    private final PermissionAssembler permissionAssembler;

    public List<PermissionDTO> queryUserSelfElements() {
        LoginUser user = ServiceContext.getCurrentUser();
        List<Permission> permissions = userPermissionService.queryUserPermissions(user.getUserId(), user.getUserCode(),
                PermissionType.PAGE_ELEMENT.getType());
        return permissions.stream().map(permissionAssembler::toPermissionDTO).toList();
    }

    public List<UserRouteDTO> queryUserSelfRoutes() {
        LoginUser user = ServiceContext.getCurrentUser();
        List<Permission> permissions = userPermissionService.queryUserPermissions(user.getUserId(), user.getUserCode(),
                PermissionType.FRONT_ROUTE.getType());
        List<Long> routeIds = permissions.stream()
                .filter(Objects::nonNull)
                .map(Permission::getResourceId)
                .toList();
        return routeGateway.selectByRouteIds(routeIds);
    }
}
