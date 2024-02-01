package com.ark.center.iam.infra.apicategory.converter;

import com.ark.center.iam.domain.apicategory.ApiCategory;
import com.ark.center.iam.infra.apicategory.repository.db.ApiCategoryDO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface ApiCategoryDomainConverter {

    default ApiCategory convert(ApiCategoryDO apiCategoryDO) {
        return ApiCategory.builder()
        		.name(apiCategoryDO.getName())
        		.applicationId(apiCategoryDO.getApplicationId())
        		.build();
    }

    @Mapping(target = "isDeleted", ignore = true)
    default ApiCategoryDO convert(ApiCategory apiCategory) {
        ApiCategoryDO apiCategoryDO = new ApiCategoryDO();
        apiCategoryDO.setName(apiCategory.getName());
        apiCategoryDO.setApplicationId(apiCategory.getApplicationId());
        apiCategoryDO.setId(apiCategory.getId());
        apiCategoryDO.setCreateTime(apiCategory.getCreateTime());
        apiCategoryDO.setUpdateTime(apiCategory.getUpdateTime());
        apiCategoryDO.setCreator(apiCategory.getCreator());
        apiCategoryDO.setModifier(apiCategory.getModifier());
        return apiCategoryDO;
    }

    List<ApiCategory> convert(List<ApiCategoryDO> categoryDOS);
}
