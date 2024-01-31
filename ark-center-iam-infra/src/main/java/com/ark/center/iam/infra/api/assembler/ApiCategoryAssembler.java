package com.ark.center.iam.infra.api.assembler;

import com.ark.center.iam.model.apicategory.command.ApiCategoryCreateCommand;
import com.ark.center.iam.model.api.dto.ApiCategoryBaseDTO;
import com.ark.center.iam.domain.apicategory.ApiCategory;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(componentModel = "spring")
public interface ApiCategoryAssembler {

    ApiCategoryBaseDTO toApiCategoryDTO(ApiCategory apiCategory);
    List<ApiCategoryBaseDTO> toApiCategoryDTO(List<ApiCategory> apiCategories);
    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "createTime", ignore = true)
    @Mapping(target = "creator", ignore = true)
    ApiCategory toApiCategoryDO(ApiCategoryCreateCommand cmd);
}
