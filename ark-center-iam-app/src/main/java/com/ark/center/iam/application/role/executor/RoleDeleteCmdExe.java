//package com.ark.center.iam.application.role.executor;
//
//import com.ark.center.iam.domain.permission.gateway.PermissionRepository;
//import com.ark.center.iam.domain.role.repository.RoleRepository;
//import com.ark.center.iam.domain.usergroup.repository.UserGroupRepository;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Component;
//
//@Component
//@RequiredArgsConstructor
//public class RoleDeleteCmdExe {
//
//    private final RoleRepository roleRepository;
//    private final UserGroupRepository userGroupRepository;
//
//    private final PermissionRepository permissionRepository;
//
//    public void execute(Long id) {
//
//        roleRepository.logicDelete(id);
//
//        // 移除用户与角色关联关系
//        removeUserRoleRelByRoleId(id);
//        // 移除用户组与角色关联关系
//        removeUserGroupRoleRelByRoleId(id);
//        // 角色与权限的关系
//        removePermissionRoleRelByRoleId(id);
//    }
//
//    private void removePermissionRoleRelByRoleId(Long roleId) {
//        permissionRepository.deletePermissionAndRoleRelationsByRoleId(roleId);
//    }
//
//    private void removeUserGroupRoleRelByRoleId(Long roleId) {
//        userGroupRepository.deleteUserGroupAndRoleRelationsByUserGroupId(roleId);
//    }
//
//    private void removeUserRoleRelByRoleId(Long roleId) {
//        roleRepository.deleteUserRoleRelationsByRoleId(roleId);
//    }
//
//}
