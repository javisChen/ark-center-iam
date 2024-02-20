package com.ark.center.iam.infra.permission.converter;

import com.ark.center.iam.domain.permission.ResourcePermission;
import com.ark.center.iam.domain.permission.vo.PermissionType;
import com.ark.center.iam.infra.permission.repository.db.PermissionDO;
import com.ark.center.iam.model.permission.vo.PermissionDTO;
import com.ark.center.iam.model.user.dto.UserApiPermissionDTO;
import com.ark.center.iam.domain.api.vo.ApiPermissionVO;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;
import org.mapstruct.Mappings;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface PermissionDomainConverter {

    @Mappings({
            @Mapping(source = "code", target = "permissionCode"),
            @Mapping(source = "id", target = "permissionId"),
    })
    PermissionDTO toPermissionDTO(ResourcePermission resourcePermission);

    @Mappings({
            @Mapping(source = "apiUri", target = "uri"),
            @Mapping(source = "apiMethod", target = "method"),
    })
    UserApiPermissionDTO toPermissionDTO(ApiPermissionVO permission);

    @Mappings({
            @Mapping(source = "apiUri", target = "uri"),
            @Mapping(source = "apiMethod", target = "method"),
    })
    List<UserApiPermissionDTO> toUserApiPermissionDTO(List<ApiPermissionVO> permissions);

    List<ResourcePermission> toDomain(List<ResourcePermission> resourcePermissions);

    default ResourcePermission toDomain(PermissionDO permissionDO) {
        return ResourcePermission.builder()
        		.applicationId(permissionDO.getApplicationId())
        		.type(PermissionType.from(permissionDO.getType()))
        		.code(permissionDO.getCode())
        		.resourceId(permissionDO.getResourceId())
        		.status(EnableDisableStatus.from(permissionDO.getStatus()))
        		.build();
    }
}
