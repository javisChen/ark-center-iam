package com.ark.center.iam.domain.permission.gateway;


import com.ark.center.iam.model.permission.vo.PermissionDTO;
import com.ark.center.iam.domain.api.vo.ApiPermissionVO;
import com.ark.center.iam.domain.permission.Permission;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.component.ddd.domain.repository.BaseRepository;

import java.util.List;

public interface PermissionRepository extends BaseRepository<Permission, Long> {

    List<Permission> selectByType(PermissionType permissionType);

    List<Permission> selectByTypeAndRoleIds(List<Long> roleIds, PermissionType permissionType);

    void save(Permission permission);

    void deletePermissionAndRoleRelationsByRoleId(Long roleId);

    void insertBatchRolePermissionRelations(Long roleId, List<Long> permissionIds);

    List<PermissionDTO> selectRolePermissions(Long applicationId, Long roleId, String type);

    void insertPermission(Long id, PermissionType permissionType);

    void deleteByResourceIds(List<Long> resourceIds);

    List<ApiPermissionVO> selectApiPermissionsByRoleIds(List<Long> roleIdSet);

    List<Long> selectResourceIdsByIds(List<Long> permissionIds);

    void deleteRolePermission(Long applicationId, Long roleId, PermissionType permissionType);

    void deleteRolePermissionByIds(Long applicationId, Long roleId, List<Long> toRemoveApiPermissionIds);

    List<Permission> byResourceIdsAndType(List<Long> resourcesIds, PermissionType type);



}
