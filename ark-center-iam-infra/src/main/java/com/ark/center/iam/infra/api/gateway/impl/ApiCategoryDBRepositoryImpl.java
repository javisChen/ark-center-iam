package com.ark.center.iam.infra.api.gateway.impl;

import com.ark.center.iam.domain.apicategory.ApiCategory;
import com.ark.center.iam.domain.apicategory.ApiCategoryRepository;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import com.ark.component.web.common.DeletedEnums;
import com.ark.component.ddd.domain.AggregateRoot;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class ApiCategoryDBRepositoryImpl extends BaseDBRepository<ApiCategory, Long> implements ApiCategoryRepository {

    @Override
    public boolean exists(String name, Long appId) {
        return lambdaQuery()
                .eq(ApiCategory::getIsDeleted, DeletedEnums.NOT.getCode())
                .eq(ApiCategory::getName, name)
                .eq(ApiCategory::getApplicationId, appId)
                .exists();
    }


    @Override
    public List<ApiCategory> byAppId(Long applicationId) {
        return lambdaQuery()
                .eq(ApiCategory::getApplicationId, applicationId)
                .list();
    }

    @Override
    public boolean existsByNameAndAppId(Long id, String name, Long applicationId) {
        return lambdaQuery()
                .eq(ApiCategory::getIsDeleted, DeletedEnums.NOT.getCode())
                .ne(id != null, AggregateRoot::getId, id)
                .eq(ApiCategory::getName, name)
                .eq(ApiCategory::getApplicationId, applicationId)
                .exists();
    }

}
