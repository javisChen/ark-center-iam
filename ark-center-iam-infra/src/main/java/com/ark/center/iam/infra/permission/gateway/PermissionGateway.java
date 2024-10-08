package com.ark.center.iam.infra.permission.gateway;


import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.infra.api.vo.ApiPermissionVO;
import com.ark.center.iam.infra.permission.Permission;
import com.ark.center.iam.infra.permission.enums.PermissionType;

import java.util.List;

public interface PermissionGateway {

    List<Permission> selectByType(PermissionType permissionType);

    List<Permission> selectByTypeAndRoleIds(List<Long> roleIds, PermissionType permissionType);

    void insert(Permission permission);

    void deletePermissionAndRoleRelationsByRoleId(Long roleId);

    void insertBatchRolePermissionRelations(Long roleId, List<Long> permissionIds);

    List<PermissionDTO> selectRolePermissions(Long applicationId, Long roleId, String type);

    void insertPermission(Long id, PermissionType permissionType);

    void deleteByResourceIds(List<Long> resourceIds);

    List<ApiPermissionVO> selectApiPermissionsByRoleIds(List<Long> roleIdSet);

    List<Long> selectResourceIdsByIds(List<Long> permissionIds);

    void deleteRolePermission(Long applicationId, Long roleId, PermissionType permissionType);

    void deleteRolePermissionByIds(Long applicationId, Long roleId, List<Long> toRemoveApiPermissionIds);

}
