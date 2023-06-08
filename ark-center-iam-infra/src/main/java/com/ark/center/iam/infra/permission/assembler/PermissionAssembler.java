package com.ark.center.iam.infra.permission.assembler;

import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.domain.permission.Permission;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;

@Mapper(componentModel = "spring")
public interface PermissionAssembler {

    @Mappings({
            @Mapping(source = "code", target = "permissionCode")
    })
    PermissionDTO toPermissionDTO(Permission permission);
}
