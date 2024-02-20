package com.ark.center.iam.domain.permission.repository;


import com.ark.center.iam.domain.permission.ResourcePermission;
import com.ark.center.iam.model.permission.vo.PermissionDTO;
import com.ark.center.iam.domain.api.vo.ApiPermissionVO;
import com.ark.center.iam.domain.permission.vo.PermissionType;
import com.ark.component.ddd.domain.repository.BaseRepository;

import java.util.List;

public interface ResourcePermissionRepository extends BaseRepository<ResourcePermission, Long> {

    List<ResourcePermission> selectByType(PermissionType permissionType);

    List<ResourcePermission> selectByTypeAndRoleIds(List<Long> roleIds, PermissionType permissionType);

    void deletePermissionAndRoleRelationsByRoleId(Long roleId);

    void insertBatchRolePermissionRelations(Long roleId, List<Long> permissionIds);

    List<PermissionDTO> selectRolePermissions(Long applicationId, Long roleId, String type);

    void insertPermission(Long id, PermissionType permissionType);

    void deleteByResourceIds(List<Long> resourceIds);

    List<ApiPermissionVO> selectApiPermissionsByRoleIds(List<Long> roleIdSet);

    List<Long> selectResourceIdsByIds(List<Long> permissionIds);

    void deleteRolePermission(Long applicationId, Long roleId, PermissionType permissionType);

    void deleteRolePermissionByIds(Long applicationId, Long roleId, List<Long> toRemoveApiPermissionIds);

    List<ResourcePermission> byResourceIdsAndType(List<Long> resourcesIds, PermissionType type);



}
