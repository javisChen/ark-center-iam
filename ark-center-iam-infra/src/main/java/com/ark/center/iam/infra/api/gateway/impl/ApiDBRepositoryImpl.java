package com.ark.center.iam.infra.api.gateway.impl;

import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.ApiRepository;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import com.ark.component.web.common.DeletedEnums;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ApiDBRepositoryImpl extends BaseDBRepository<Api, Long> implements ApiRepository {

    @Override
    public boolean existsByAppIdAndMethodAndUrl(Long excludeId, Long applicationId, String method, String url) {
        return lambdaQuery()
                .ne(excludeId != null, AggregateRoot::getId, excludeId)
                .eq(Api::getUri, url)
                .eq(Api::getMethod, method)
                .eq(Api::getApplicationId, applicationId)
                .eq(Api::getIsDeleted, DeletedEnums.NOT.getCode()).exists();
    }

//    @Override
//    public List<Api> selectByIds(List<Long> resourceIds) {
//        return lambdaQuery()
//                .in(AggregateRoot::getId, resourceIds)
//                .eq(Api::getIsDeleted, 0)
//                .list();
//    }

    @Override
    public List<Api> byAppId(Long applicationId) {
        return lambdaQuery()
                .eq(Api::getApplicationId, applicationId)
                .eq(Api::getIsDeleted, 0)
                .list();
    }

}
