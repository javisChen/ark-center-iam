package com.ark.center.iam.infra.api.gateway;

import com.ark.center.iam.client.api.dto.ApiCategoryBaseDTO;
import com.ark.center.iam.infra.api.ApiCategory;

import java.util.List;

public interface ApiCategoryGateway {

    List<ApiCategoryBaseDTO> selectList(Long applicationId);

    void insert(ApiCategory apiCategory);

    ApiCategory selectByNameAndApplicationId(String name, Long applicationId);

    void update(ApiCategory apiCategory);

    void logicDelete(Long id);

    List<ApiCategory> selectByApplicationId(Long applicationId);
}
