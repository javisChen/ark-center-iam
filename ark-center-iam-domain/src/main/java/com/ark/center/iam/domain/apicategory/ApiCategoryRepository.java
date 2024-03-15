package com.ark.center.iam.domain.apicategory;

import com.ark.component.ddd.domain.repository.BaseRepository;

import java.util.List;

public interface ApiCategoryRepository extends BaseRepository<ApiCategory, Long> {

    List<ApiCategory> byAppId(Long applicationId);

    boolean existsByNameAndAppId(Long id, String name, Long applicationId);

}
