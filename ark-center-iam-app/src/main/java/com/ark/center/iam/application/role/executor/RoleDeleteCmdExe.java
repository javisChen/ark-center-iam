package com.ark.center.iam.application.role.executor;

import com.ark.center.iam.infra.permission.gateway.impl.PermissionService;
import com.ark.center.iam.infra.role.gateway.RoleGateway;

import com.ark.center.iam.infra.usergroup.service.UserGroupService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class RoleDeleteCmdExe {

    private final RoleGateway roleGateway;
    private final UserGroupService userGroupService;
    private final PermissionService permissionGateway;

    public void execute(Long id) {

        roleGateway.logicDelete(id);

        // 移除用户与角色关联关系
        removeUserRoleRelByRoleId(id);
        // 移除用户组与角色关联关系
        removeUserGroupRoleRelByRoleId(id);
        // 角色与权限的关系
        removePermissionRoleRelByRoleId(id);
    }

    private void removePermissionRoleRelByRoleId(Long roleId) {
        permissionGateway.deletePermissionAndRoleRelationsByRoleId(roleId);
    }

    private void removeUserGroupRoleRelByRoleId(Long roleId) {
        userGroupService.deleteUserGroupAndRoleRelationsByUserGroupId(roleId);
    }

    private void removeUserRoleRelByRoleId(Long roleId) {
        roleGateway.deleteUserRoleRelationsByRoleId(roleId);
    }

}
