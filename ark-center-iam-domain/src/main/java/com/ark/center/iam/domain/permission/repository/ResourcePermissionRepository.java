package com.ark.center.iam.domain.permission.repository;


import com.ark.center.iam.domain.permission.ResourcePermission;
import com.ark.center.iam.domain.permission.vo.PermissionType;
import com.ark.component.ddd.domain.repository.BaseRepository;

import java.util.List;

public interface ResourcePermissionRepository extends BaseRepository<ResourcePermission, Long> {


    List<ResourcePermission> byResourceIdsAndType(List<Long> resourcesIds, PermissionType type);



}
