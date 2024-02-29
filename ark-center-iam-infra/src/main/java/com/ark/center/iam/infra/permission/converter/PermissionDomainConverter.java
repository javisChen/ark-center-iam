package com.ark.center.iam.infra.permission.converter;

import com.ark.center.iam.domain.permission.ResourcePermission;
import com.ark.center.iam.domain.permission.vo.PermissionType;
import com.ark.center.iam.infra.permission.repository.db.PermissionDO;
import com.ark.center.iam.model.permission.vo.PermissionDTO;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;



@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface PermissionDomainConverter {

    default PermissionDTO toPermissionDTO(PermissionDO permissionDO) {
        return new PermissionDTO(permissionDO.getId(), permissionDO.getCode());
    }

    List<ResourcePermission> toDomain(List<PermissionDO> permissionDOS);

    default ResourcePermission toDomain(PermissionDO permissionDO) {
        ResourcePermission resourcePermission = new ResourcePermission();
        resourcePermission.setApplicationId(permissionDO.getApplicationId());
        resourcePermission.setType(PermissionType.from(permissionDO.getType()));
        resourcePermission.setCode(permissionDO.getCode());
        resourcePermission.setResourceId(permissionDO.getResourceId());
        resourcePermission.setStatus(EnableDisableStatus.from(permissionDO.getStatus()));
        resourcePermission.setId(permissionDO.getId());
        resourcePermission.setCreateTime(permissionDO.getCreateTime());
        resourcePermission.setUpdateTime(permissionDO.getUpdateTime());
        resourcePermission.setCreator(permissionDO.getCreator());
        resourcePermission.setModifier(permissionDO.getModifier());
        return resourcePermission;
    }

    default PermissionDO fromDomain(ResourcePermission resourcePermission) {
        PermissionDO permissionDO = new PermissionDO();
        permissionDO.setApplicationId(resourcePermission.getApplicationId());
        permissionDO.setType(resourcePermission.getType().getName());
        permissionDO.setCode(resourcePermission.getCode());
        permissionDO.setResourceId(resourcePermission.getResourceId());
        permissionDO.setStatus(resourcePermission.getStatus().getValue());
        permissionDO.setId(resourcePermission.getId());
        return permissionDO;
    }
}
