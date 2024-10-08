package com.ark.center.iam.infra.api.assembler;

import com.ark.center.iam.client.api.command.ApiUpdateCmd;
import com.ark.center.iam.client.api.dto.ApiDetailDTO;
import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.infra.api.Api;
import org.apache.commons.lang3.StringUtils;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface ApiAssembler {

    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "permissionId", ignore = true)
    @Mapping(target = "permissionCode", ignore = true)
    @Mapping(target = "createTime", ignore = true)
    ApiDetailsDTO toApiDTO(Api api);

    ApiDetailDTO toApiDetailDTO(Api api);

    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "hasPathVariable", ignore = true)
    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "createTime", ignore = true)
    @Mapping(target = "creator", ignore = true)
    default Api toApiDO(ApiUpdateCmd dto) {
        Api api = new Api();
        api.setId(dto.getId());
        api.setName(dto.getName());
        api.setApplicationId(dto.getApplicationId());
        api.setCategoryId(dto.getCategoryId());
        api.setUri(dto.getUri());
        api.setMethod(dto.getMethod());
        api.setAuthType(dto.getAuthType());
        api.setStatus(dto.getStatus());
        // 约定规则，如果url包含了*号就代表是包含了路径参数
        api.setHasPathVariable(StringUtils.contains(dto.getUri(), "*"));
        return api;
    }
}
