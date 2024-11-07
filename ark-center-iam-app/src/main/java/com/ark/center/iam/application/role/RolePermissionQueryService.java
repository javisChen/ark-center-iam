package com.ark.center.iam.application.role;


import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.infra.permission.enums.PermissionType;
import com.ark.center.iam.infra.permission.gateway.impl.PermissionService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class RolePermissionQueryService {

    private final PermissionService permissionService;
    
    public List<PermissionDTO> queryRoleRoutesPermissions(Long roleId, Long applicationId) {
        return permissionService.selectRolePermissions(applicationId, roleId, PermissionType.FRONT_ROUTE.getName());
    }

    public List<PermissionDTO> queryRoleApiPermissions(Long roleId, Long applicationId) {
        return permissionService.selectRolePermissions(applicationId, roleId, PermissionType.SER_API.getName());
    }

    public List<PermissionDTO> queryRoleElementPermissions(Long roleId, Long applicationId) {
        return permissionService.selectRolePermissions(applicationId, roleId, PermissionType.PAGE_ELEMENT.getName());
    }
}
