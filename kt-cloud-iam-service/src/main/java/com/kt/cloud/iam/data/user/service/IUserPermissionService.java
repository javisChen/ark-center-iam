package com.kt.cloud.iam.data.user.service;

import com.kt.cloud.iam.api.user.permission.request.ApiAuthRequest;
import com.kt.cloud.iam.api.user.permission.response.ApiAuthResponse;
import com.kt.cloud.iam.dao.entity.IamPermission;
import com.kt.cloud.iam.data.permission.vo.PermissionVO;
import com.kt.cloud.iam.data.user.vo.UserPermissionRouteNavVO;
import com.kt.cloud.iam.enums.PermissionTypeEnums;

import java.util.List;

public interface IUserPermissionService {

    /**
     * 获取用户所拥有的的权限
     * @param userId              用户id
     * @param permissionTypeEnums 权限类型
     */
    List<IamPermission> getUserPermissions(Long userId, PermissionTypeEnums permissionTypeEnums);

    /**
     * 获取指定类型下的所有权限
     * @param permissionTypeEnums 权限类型
     */
    List<IamPermission> getUserPermissions(PermissionTypeEnums permissionTypeEnums);

    /**
     * 获取用户路由权限（前端菜单展示）
     * @param userId 用户id
     */
    List<UserPermissionRouteNavVO> getUserRoutes(long userId);

    /**
     * 获取用户路由权限（前端菜单展示）
     * @param userCode 用户code
     */
    List<UserPermissionRouteNavVO> getUserRoutes(String userCode);

    /**
     * 获取用户页面元素权限
     * @param userId 用户id
     */
    List<PermissionVO> getUserPermissionPageElements(long userId);


    /**
     * 获取用户页面元素权限
     * @param userCode 用户code
     */
    List<PermissionVO> getUserPermissionPageElements(String userCode);

    /**
     * 判断是否超级管理员
     * @param userCode 用户编码
     */
    boolean isSuperAdmin(String userCode);

    boolean checkHasApiPermission(String applicationCode, String userCode, String url, String method);

    ApiAuthResponse checkApiPermission(ApiAuthRequest request);

}
