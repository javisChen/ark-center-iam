package com.ark.center.iam.domain.user.service;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.domain.api.vo.ApiPermissionVO;
import com.ark.center.iam.domain.application.Application;
import com.ark.center.iam.domain.application.gateway.ApplicationGateway;
import com.ark.center.iam.domain.permission.Permission;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.gateway.PermissionGateway;
import com.ark.center.iam.domain.role.gateway.RoleGateway;
import com.ark.center.iam.domain.user.User;
import com.ark.center.iam.domain.user.gateway.UserGateway;
import com.ark.center.iam.domain.user.support.UserConst;
import com.ark.center.iam.domain.usergroup.gateway.UserGroupGateway;
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

    private final PermissionGateway permissionGateway;

    private final RoleGateway roleGateway;

    private final UserGateway userGateway;

    private final UserGroupGateway userGroupGateway;

    private final ApplicationGateway applicationGateway;
    private final AntPathMatcher antPathMatcher = new AntPathMatcher();

    public List<Permission> queryUserElements(Long userId, String userCode) {
        String pageElementType = PermissionType.PAGE_ELEMENT.getType();
        return queryUserPermissions(userId, userCode, pageElementType);
    }

    public List<Permission> queryUserPermissions(Long userId, String userCode, String pageElementType) {
        List<Permission> permissions;
        // 超管直接赋予所有权限
        if (isSuperAdmin(userCode)) {
            permissions = queryWholeElementsPermissions(pageElementType);
        } else {
            permissions = queryUserPermissions(userId, pageElementType);
        }
        return permissions;
    }

    private List<Permission> queryWholeElementsPermissions(String pageElementType) {
        return permissionGateway.selectByType(pageElementType);
    }

    public boolean isSuperAdmin(String userCode) {
        return UserConst.SUPER_ADMIN.equals(userCode);
    }

    public List<Permission> queryUserPermissions(Long userId, String permissionType) {
        List<Long> roleIds = queryUserRoles(userId);
        return permissionGateway.selectByTypeAndRoleIds(roleIds, permissionType);
    }

    /**
     * 获取用户的所有角色
     */
    private List<Long> queryUserRoles(Long userId) {
        // 用户自身拥有的角色
        List<Long> roleIds = roleGateway.selectRoleIdsByUserId(userId);
        // 用户所归属的用户组所拥有的角色
        List<Long> userGroupIds = userGroupGateway.selectUserGroupIdsByUserId(userId, true);
        List<Long> userGroupsRoleIds = roleGateway.selectRoleIdsByUserGroupIds(userGroupIds);
        roleIds.addAll(userGroupsRoleIds);
        return roleIds.stream().distinct().toList();
    }

    public boolean checkHasApiPermission(String applicationCode, Long userId, String url, String method) {
        User user = userGateway.selectByUserId(userId);
        // 超管账号直接通过
        if (isSuperAdmin(user.getCode())) {
            return true;
        }
        List<Long> roleIds = queryUserRoles(userId);
        // 如果账号包含超管角色，直接通过
        if (roleIds.stream().anyMatch(item -> item.equals(1L))) {
            return true;
        }
        List<ApiPermissionVO> apiPermissions = getApiPermissionByRoleIdsAndApplicationCode(applicationCode, roleIds);
        return apiPermissions.stream().anyMatch(item -> matchApi(url, method, item));
    }

    public List<ApiPermissionVO> getApiPermissionByRoleIdsAndApplicationCode(String applicationCode, List<Long> roleIds) {
        if (CollectionUtil.isEmpty(roleIds)) {
            return Collections.emptyList();
        }
        Application application = applicationGateway.selectByCode(applicationCode);
        if (application == null) {
            return Collections.emptyList();
        }
        return permissionGateway.selectApiPermissionsByRoleIdsAndApplicationId(application.getId(), roleIds);
    }

    private boolean matchApi(String url, String method, ApiPermissionVO item) {
        boolean methodEquals = item.getApiMethod().equalsIgnoreCase(method);
        boolean urlEquals = antPathMatcher.match(item.getApiUrl(), url);
        return methodEquals && urlEquals;
    }

}