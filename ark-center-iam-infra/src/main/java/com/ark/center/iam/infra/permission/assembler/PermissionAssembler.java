package com.ark.center.iam.infra.permission.assembler;

import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.client.user.dto.UserApiPermissionDTO;
import com.ark.center.iam.domain.api.vo.ApiPermissionVO;
import com.ark.center.iam.domain.permission.Permission;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;
import org.mapstruct.Mappings;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface PermissionAssembler {

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
}
