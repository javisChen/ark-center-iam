package com.ark.center.iam.domain.apicategory;

import com.ark.center.iam.domain.apicategory.ApiCategory;

import java.util.List;

public interface ApiCategoryGateway {

    void save(ApiCategory apiCategory);

    boolean exists(String name, Long applicationId);

    void update(ApiCategory apiCategory);

    void delete(Long id);

    List<ApiCategory> selectByApplicationId(Long applicationId);

    boolean existsByNameAndAppId(Long id, String name, Long applicationId);

    ApiCategory byId(Long id);
}
