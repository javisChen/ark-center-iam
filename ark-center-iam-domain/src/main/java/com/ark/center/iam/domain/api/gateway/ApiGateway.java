package com.ark.center.iam.domain.api.gateway;

import com.ark.center.iam.domain.api.Api;

import java.util.List;

public interface ApiGateway {

    boolean existsByAppIdAndMethodAndUrl(Long excludeId, Long applicationId, String method, String url);

    void save(Api api);

    Api byId(Long id);

//    void updateByApiId(Api apiUpdate);

    void delete(Long id);

    List<Api> selectByIds(List<Long> resourceIds);

    List<Api> byAppId(Long applicationId);

}
