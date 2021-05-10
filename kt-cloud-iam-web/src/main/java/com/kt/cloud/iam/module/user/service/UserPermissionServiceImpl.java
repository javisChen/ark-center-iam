package com.kt.cloud.iam.module.user.service;

import cn.hutool.core.collection.CollectionUtil;
import com.kt.cloud.iam.auth.core.check.AuthCheck;
import com.kt.cloud.iam.auth.core.model.AuthRequest;
import com.kt.cloud.iam.auth.core.model.AuthResponse;
import com.kt.cloud.iam.enums.PermissionTypeEnums;
import com.kt.cloud.iam.module.permission.bo.ApiPermissionBO;
import com.kt.cloud.iam.module.permission.persistence.IamPermission;
import com.kt.cloud.iam.module.permission.service.IPermissionService;
import com.kt.cloud.iam.module.permission.vo.PermissionVO;
import com.kt.cloud.iam.module.role.service.IRoleService;
import com.kt.cloud.iam.module.route.service.IRouteService;
import com.kt.cloud.iam.module.user.common.UserConst;
import com.kt.cloud.iam.module.user.converter.UserBeanConverter;
import com.kt.cloud.iam.module.user.persistence.IamUser;
import com.kt.cloud.iam.module.user.vo.UserPermissionRouteNavVO;
import com.kt.cloud.iam.module.usergroup.service.IUserGroupService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.AntPathMatcher;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 用户权限相关
 */
@Service
@Slf4j
public class UserPermissionServiceImpl implements IUserPermissionService {

    @Autowired
    private IPermissionService iPermissionService;
    @Autowired
    private IUserService iUserService;
    @Autowired
    private IRoleService iRoleService;
    @Autowired
    private IUserGroupService iUserGroupService;
    @Autowired
    private UserBeanConverter beanConverter;
    @Autowired
    private IRouteService iRouteService;
    @Autowired
    private AuthCheck remoteAuthCheck;

    private AntPathMatcher antPathMatcher = new AntPathMatcher();

    @Override
    public List<IamPermission> getUserPermissions(Long userId, PermissionTypeEnums permissionTypeEnums) {
        Set<Long> roleIdSet = getUserAllRoles(userId);
        return iPermissionService.getPermissionByRoleIds(roleIdSet, permissionTypeEnums);
    }

    @Override
    public List<IamPermission> getUserPermissions(PermissionTypeEnums permissionTypeEnums) {
        return iPermissionService.getAllPermissionsByType(permissionTypeEnums);
    }

    @Override
    public List<UserPermissionRouteNavVO> getUserRoutes(long userId) {
        List<IamPermission> userRoutePermissions = getUserPermissions(userId, PermissionTypeEnums.FRONT_ROUTE);
        return getUserRoutesByPermissionIds(userRoutePermissions);
    }

    @Override
    public List<UserPermissionRouteNavVO> getUserRoutes(String userCode) {
        List<IamPermission> permissions;
        // 超管直接赋予所有权限
        if (isSuperAdmin(userCode)) {
            permissions = iPermissionService.getAllPermissionsByType(PermissionTypeEnums.FRONT_ROUTE);
        } else {
            IamUser user = iUserService.getUserByCode(userCode);
            permissions = getUserPermissions(user.getId(), PermissionTypeEnums.FRONT_ROUTE);
        }
        return getUserRoutesByPermissionIds(permissions);
    }

    @Override
    public boolean isSuperAdmin(String userCode) {
        return UserConst.SUPER_ADMIN.equals(userCode);
    }

    @Override
    public List<PermissionVO> getUserPermissionPageElements(long userId) {
        List<IamPermission> permissions = getUserPermissions(userId, PermissionTypeEnums.PAGE_ELEMENT);
        return permissions.stream().map(beanConverter::convertToPermissionVO).collect(Collectors.toList());
    }

    @Override
    public List<PermissionVO> getUserPermissionPageElements(String userCode) {
        List<IamPermission> permissions;
        // 超管直接赋予所有权限
        if (isSuperAdmin(userCode)) {
            permissions = iPermissionService.getAllPermissionsByType(PermissionTypeEnums.PAGE_ELEMENT);
        } else {
            IamUser user = iUserService.getUserByCode(userCode);
            permissions = getUserPermissions(user.getId(), PermissionTypeEnums.PAGE_ELEMENT);
        }
        return permissions.stream().map(beanConverter::convertToPermissionVO).collect(Collectors.toList());
    }

    /**
     * 获取用户的所有角色
     */
    private Set<Long> getUserAllRoles(Long userId) {
        // 用户自身拥有的角色
        List<Long> roleIds = iRoleService.getRoleIdsByUserId(userId);
        // 用户所归属的用户组所拥有的角色
        List<Long> userGroupIds = iUserGroupService.getUserGroupsIdIncludeParentByUserId(userId);
        List<Long> userGroupsRoleIds = iRoleService.getRoleIdsByUserGroupIds(userGroupIds);
        roleIds.addAll(userGroupsRoleIds);
        // 排重
        Set<Long> roleIdSet = new HashSet<>(roleIds);
        log.debug("角色交集 --------> {}", roleIdSet);
        return roleIdSet;
    }

    private List<UserPermissionRouteNavVO> getUserRoutesByPermissionIds(List<IamPermission> userRoutePermissions) {
        if (CollectionUtil.isEmpty(userRoutePermissions)) {
            return CollectionUtil.newArrayList();
        }
        List<Long> routeIds = userRoutePermissions.stream()
                .map(IamPermission::getResourceId).collect(Collectors.toList());
        return iRouteService.getRouteVOSByIds(routeIds);
    }

    @Override
    public boolean checkHasApiPermission(String applicationCode, String userCode, String url, String method) {
        IamUser user = iUserService.getUserByCode(userCode);
        // 超管账号直接通过
        if (isSuperAdmin(user.getCode())) {
            return true;
        }
        Long userId = user.getId();
        Set<Long> roleIdSet = getUserAllRoles(userId);
        // 如果账号包含超管角色，直接通过
        if (roleIdSet.stream().anyMatch(item -> item.equals(1L))) {
            return true;
        }
        Set<ApiPermissionBO> apiPermissions = iPermissionService
                .getApiPermissionByRoleIdsAndApplicationCode(applicationCode, roleIdSet);
        return apiPermissions.stream().anyMatch(item -> matchApi(url, method, item));
    }

    private boolean matchApi(String url, String method, ApiPermissionBO item) {
        boolean methodEquals = item.getApiMethod().equalsIgnoreCase(method);
        boolean urlEquals = antPathMatcher.match(item.getApiUrl(), url);
        return methodEquals && urlEquals;
    }

    @Override
    public AuthResponse checkApiPermission(AuthRequest request) {
        boolean hasApiPermission = checkHasApiPermission(request.getApplicationCode(), request.getUserCode(),
                request.getRequestUri(), request.getMethod());
        if (hasApiPermission) {
            return AuthResponse.success();
        }
        return AuthResponse.fail("No Permission");
    }

    @Override
    public AuthResponse accessCheck(AuthRequest request) {
        return remoteAuthCheck.checkPermission(request);
    }

}
