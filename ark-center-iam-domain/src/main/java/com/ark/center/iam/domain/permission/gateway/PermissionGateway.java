package com.ark.center.iam.domain.permission.gateway;


import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.domain.api.vo.ApiPermissionVO;
import com.ark.center.iam.domain.permission.Permission;
import com.ark.center.iam.domain.permission.enums.PermissionType;

import java.util.List;

public interface PermissionGateway {

    List<Permission> selectByType(String permissionType);

    List<Permission> selectByTypeAndRoleIds(List<Long> roleIds, String permissionType);

    void insert(Permission permission);

    void deletePermissionAndRoleRelationsByRoleId(Long roleId);

    void deleteRolePermission(Long roleId, List<Long> permissionIds);

    void insertBatchRolePermissionRelations(Long roleId, List<Long> permissionIds);

    List<PermissionDTO> selectRolePermissions(Long applicationId, Long roleId, String type);

    void insertPermission(Long id, PermissionType permissionType);

    void deleteByResourceIds(List<Long> resourceIds);

    List<ApiPermissionVO> selectApiPermissionsByRoleIdsAndApplicationId(Long applicationId, List<Long> roleIdSet);
}
