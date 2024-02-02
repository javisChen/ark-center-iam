package com.ark.center.iam.infra.permission.converter;

import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.infra.permission.repository.db.PermissionDO;
import com.ark.center.iam.model.permission.vo.PermissionDTO;
import com.ark.center.iam.model.user.dto.UserApiPermissionDTO;
import com.ark.center.iam.domain.api.vo.ApiPermissionVO;
import com.ark.center.iam.domain.permission.Permission;
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
    PermissionDTO toPermissionDTO(Permission permission);

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

    List<Permission> toDomain(List<Permission> permissions);

    default Permission toDomain(PermissionDO permissionDO) {
        return Permission.builder()
        		.applicationId(permissionDO.getApplicationId())
        		.type(PermissionType.from(permissionDO.getType()))
        		.code(permissionDO.getCode())
        		.resourceId(permissionDO.getResourceId())
        		.status(permissionDO.getStatus())
        		.isDeleted(permissionDO.getIsDeleted())
        		.build();
    }
}
