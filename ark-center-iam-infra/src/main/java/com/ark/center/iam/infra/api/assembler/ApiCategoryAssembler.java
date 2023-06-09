package com.ark.center.iam.infra.api.assembler;

import com.ark.center.iam.client.api.command.ApiCategoryCmd;
import com.ark.center.iam.client.api.dto.ApiCategoryBaseDTO;
import com.ark.center.iam.domain.api.ApiCategory;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface ApiCategoryAssembler {

    ApiCategoryBaseDTO toApiCategoryDTO(ApiCategory apiCategory);
    List<ApiCategoryBaseDTO> toApiCategoryDTO(List<ApiCategory> apiCategories);

    ApiCategory toApiCategoryDO(ApiCategoryCmd cmd);
}
