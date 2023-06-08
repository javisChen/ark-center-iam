package com.ark.center.iam.application.user.executor;

import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.client.user.dto.UserPermissionRouteNavVO;
import com.ark.center.iam.domain.permission.Permission;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.user.service.UserPermissionService;
import com.ark.center.iam.infra.user.converter.UserBeanConverter;
import com.ark.component.context.core.ServiceContext;
import com.ark.component.security.base.user.LoginUserContext;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class UserSelfQryExe {

    private final UserPermissionService userPermissionService;
    private final UserPermissionService userPermissionService;

    private final UserBeanConverter beanConverter;

    public List<PermissionDTO> queryUserSelfElements() {
        LoginUserContext user = ServiceContext.getCurrentUser();
        List<Permission> permissions = userPermissionService.queryUserPermissions(user.getUserId(), user.getUserCode(),
                PermissionType.PAGE_ELEMENT.getType());
        return permissions.stream().map(beanConverter::convertToPermissionDTO).toList();
    }

    public List<UserPermissionRouteNavVO> queryUserSelfRoutes() {
        LoginUserContext user = ServiceContext.getCurrentUser();
        List<Permission> permissions = userPermissionService.queryUserPermissions(user.getUserId(), user.getUserCode(),
                PermissionType.FRONT_ROUTE.getType());
        return permissions.stream().map(beanConverter::convertToPermissionDTO).toList();
    }
}
