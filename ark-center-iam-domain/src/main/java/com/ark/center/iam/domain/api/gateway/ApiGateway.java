package com.ark.center.iam.domain.api.gateway;

import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.client.api.query.ApiQuery;
import com.ark.center.iam.domain.api.Api;

import java.util.List;

public interface ApiGateway {

    List<ApiDetailsDTO> selectList(ApiQuery apiQuery);

    Api selectApiByApplicationIdAndMethodAndUrl(Long applicationId, String method, String url);

    void insert(Api api);

    Api selectById(Long id);

    void updateByApiId(Api apiUpdate);

    void delete(Long id);

    List<Api> selectByIds(List<Long> resourceIds);

    List<Api> selectByApplicationId(Long applicationId);

    boolean insertOrUpdate(Api api);
}
