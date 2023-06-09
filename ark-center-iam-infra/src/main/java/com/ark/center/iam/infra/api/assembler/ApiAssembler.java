package com.ark.center.iam.infra.api.assembler;

import com.ark.center.iam.client.api.command.ApiUpdateCmd;
import com.ark.center.iam.client.api.dto.ApiListDTO;
import com.ark.center.iam.domain.api.Api;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface ApiAssembler {

    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "permissionId", ignore = true)
    @Mapping(target = "permissionCode", ignore = true)
    @Mapping(target = "createTime", ignore = true)
    ApiListDTO toApiDTO(Api api);

    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "hasPathVariable", ignore = true)
    @Mapping(target = "gmtModified", ignore = true)
    @Mapping(target = "gmtCreate", ignore = true)
    @Mapping(target = "creator", ignore = true)
    Api toAPIDO(ApiUpdateCmd dto);
}
