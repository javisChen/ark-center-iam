package com.ark.center.iam.application.apicategory.assembler;

import com.ark.center.iam.infra.apicategory.repository.db.ApiCategoryDO;
import com.ark.center.iam.model.api.dto.ApiCategoryBaseDTO;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface ApiCategoryAssembler {

    ApiCategoryBaseDTO toApiCategoryDTO(ApiCategoryDO apiCategory);

    List<ApiCategoryBaseDTO> toApiCategoryDTO(List<ApiCategoryDO> apiCategories);

}
