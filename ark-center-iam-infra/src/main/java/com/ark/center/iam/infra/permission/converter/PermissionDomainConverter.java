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
        return ResourcePermission.builder()
        		.applicationId(permissionDO.getApplicationId())
        		.type(PermissionType.from(permissionDO.getType()))
        		.code(permissionDO.getCode())
        		.resourceId(permissionDO.getResourceId())
        		.status(EnableDisableStatus.from(permissionDO.getStatus()))
        		.build();
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
