package com.ark.center.iam.infra.api.assembler;

import com.ark.center.iam.client.api.command.ApiCategoryCommand;
import com.ark.center.iam.client.api.dto.ApiCategoryBaseDTO;
import com.ark.center.iam.infra.api.ApiCategory;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface ApiCategoryAssembler {

    ApiCategoryBaseDTO toApiCategoryDTO(ApiCategory apiCategory);
    List<ApiCategoryBaseDTO> toApiCategoryDTO(List<ApiCategory> apiCategories);
    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "createTime", ignore = true)
    @Mapping(target = "creator", ignore = true)
    ApiCategory toApiCategoryDO(ApiCategoryCommand command);
}
