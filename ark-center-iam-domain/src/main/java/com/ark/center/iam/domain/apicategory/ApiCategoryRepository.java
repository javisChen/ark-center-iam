package com.ark.center.iam.domain.apicategory;

import com.ark.component.ddd.domain.repository.BaseRepository;

import java.util.List;

public interface ApiCategoryRepository extends BaseRepository<ApiCategory, Long> {

    void saveAndPublishEvents(ApiCategory apiCategory);

    boolean exists(String name, Long applicationId);

    List<ApiCategory> byAppId(Long applicationId);

    boolean existsByNameAndAppId(Long id, String name, Long applicationId);

    ApiCategory byId(Long id);
}
