package com.ark.center.iam.domain.api.gateway;

import com.ark.center.iam.domain.api.Api;

import java.util.List;

public interface ApiGateway {

    Api selectApiByApplicationIdAndMethodAndUrl(Long applicationId, String method, String url);

    void insert(Api api);

    Api selectById(Long id);

    void updateByApiId(Api apiUpdate);

    void delete(Long id);

    List<Api> selectByIds(List<Long> resourceIds);

    List<Api> selectByApplicationId(Long applicationId);

    boolean insertOrUpdate(Api api);
}
