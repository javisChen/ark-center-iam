package com.ark.center.iam.infra.user.service;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.infra.api.vo.ApiPermissionVO;
import com.ark.center.iam.infra.permission.Permission;
import com.ark.center.iam.infra.permission.enums.PermissionType;
import com.ark.center.iam.infra.permission.gateway.impl.PermissionService;

import com.ark.center.iam.infra.role.service.RoleService;
import com.ark.center.iam.infra.user.User;
import com.ark.center.iam.infra.user.support.UserConst;

import com.ark.center.iam.infra.usergroup.service.UserGroupService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.AntPathMatcher;

import java.util.Collections;
import java.util.List;

/**
 * 用户权限服务
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class UserPermissionService {

    private final PermissionService permissionService;

    private final RoleService roleService;

    private final UserService userService;

    private final UserGroupService userGroupService;

    private final AntPathMatcher antPathMatcher = new AntPathMatcher();

    public List<Permission> queryUserPermissions(Long userId, PermissionType permissionType) {
        User user = userService.selectByUserId(userId);
        String userCode = user.getCode();
        List<Permission> permissions;
        // 超管直接赋予所有权限
        if (isSuperAdmin(userCode)) {
            permissions = permissionService.selectByType(permissionType);
        } else {
            List<Long> roleIds = queryUserRoles(userId);
            permissions = permissionService.selectByTypeAndRoleIds(roleIds, permissionType);
        }
        return permissions;
    }

    public boolean isSuperAdmin(String userCode) {
        return UserConst.SUPER_ADMIN.equals(userCode);
    }

    /**
     * 获取用户的所有角色
     */
    private List<Long> queryUserRoles(Long userId) {
        // 用户自身拥有的角色
        List<Long> roleIds = roleService.queryRoleIdsByUserId(userId);
        // 用户所归属的用户组所拥有的角色
        List<Long> userGroupIds = userGroupService.selectUserGroupIdsByUserId(userId, true);
        List<Long> userGroupsRoleIds = roleService.selectRoleIdsByUserGroupIds(userGroupIds);
        roleIds.addAll(userGroupsRoleIds);
        return roleIds.stream().distinct().toList();
    }

    public boolean checkHasApiPermission(Long userId, String url, String method) {
        User user = userService.selectByUserId(userId);
        // 超管账号直接通过
        if (isSuperAdmin(user.getCode())) {
            return true;
        }
        List<Long> roleIds = queryUserRoles(userId);
        // 如果账号包含超管角色，直接通过
        if (roleIds.stream().anyMatch(item -> item.equals(1L))) {
            return true;
        }
        List<ApiPermissionVO> apiPermissions = queryPermissionByRoleIds(roleIds);
        return apiPermissions.stream().anyMatch(item -> matchApi(url, method, item));
    }

    public List<ApiPermissionVO> queryPermissionByRoleIds(List<Long> roleIds) {
        if (CollectionUtil.isEmpty(roleIds)) {
            return Collections.emptyList();
        }
        return permissionService.queryApiPermissionsByRoleIds(roleIds);
    }

    public List<ApiPermissionVO> queryUserApiPermissions(Long userId) {
         List<Long> roleIds = queryUserRoles(userId);
        if (CollectionUtil.isEmpty(roleIds)) {
            return Collections.emptyList();
        }
        return queryPermissionByRoleIds(roleIds);
    }

    private boolean matchApi(String uri, String method, ApiPermissionVO item) {
        boolean methodEquals = item.getApiMethod().equalsIgnoreCase(method);
        boolean uriEquals = antPathMatcher.match(item.getApiUri(), uri);
        return methodEquals && uriEquals;
    }

}