package com.ark.center.iam.domain.user.service;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.domain.api.vo.ApiPermissionVO;
import com.ark.center.iam.domain.permission.Permission;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.gateway.PermissionRepository;
import com.ark.center.iam.domain.role.repository.RoleRepository;
import com.ark.center.iam.domain.user.User;
import com.ark.center.iam.domain.user.repository.UserRepository;
import com.ark.center.iam.domain.user.support.UserConst;
import com.ark.center.iam.domain.usergroup.repository.UserGroupRepository;
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

    private final PermissionRepository permissionRepository;

    private final RoleRepository roleRepository;

    private final UserRepository userRepository;

    private final UserGroupRepository userGroupRepository;

    private final AntPathMatcher antPathMatcher = new AntPathMatcher();

    public List<Permission> queryUserPermissions(Long userId, PermissionType permissionType) {
        User user = userRepository.selectByUserId(userId);
        String userCode = user.getCode();
        List<Permission> permissions;
        // 超管直接赋予所有权限
        if (isSuperAdmin(userCode)) {
            permissions = permissionRepository.selectByType(permissionType);
        } else {
            List<Long> roleIds = queryUserRoles(userId);
            permissions = permissionRepository.selectByTypeAndRoleIds(roleIds, permissionType);
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
        List<Long> roleIds = roleRepository.selectRoleIdsByUserId(userId);
        // 用户所归属的用户组所拥有的角色
        List<Long> userGroupIds = userGroupRepository.selectUserGroupIdsByUserId(userId, true);
        List<Long> userGroupsRoleIds = roleRepository.selectRoleIdsByUserGroupIds(userGroupIds);
        roleIds.addAll(userGroupsRoleIds);
        return roleIds.stream().distinct().toList();
    }

    public boolean checkHasApiPermission(Long userId, String url, String method) {
        User user = userRepository.selectByUserId(userId);
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
        return permissionRepository.selectApiPermissionsByRoleIds(roleIds);
    }

    public List<ApiPermissionVO> getUserApiPermissions(Long userId) {
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