package com.ark.center.iam.domain.permission.repository;


import com.ark.center.iam.domain.permission.ResourcePermission;
import com.ark.center.iam.domain.permission.vo.PermissionType;
import com.ark.center.iam.model.permission.vo.PermissionDTO;
import com.ark.component.ddd.domain.repository.BaseRepository;

import java.util.List;

public interface ResourcePermissionRepository extends BaseRepository<ResourcePermission, Long> {

    void insertBatchRolePermissionRelations(Long roleId, List<Long> permissionIds);

    List<PermissionDTO> selectRolePermissions(Long applicationId, Long roleId, String type);

    void deleteRolePermissionByIds(Long applicationId, Long roleId, List<Long> toRemoveApiPermissionIds);

    List<ResourcePermission> byResourceIdsAndType(List<Long> resourcesIds, PermissionType type);



}
