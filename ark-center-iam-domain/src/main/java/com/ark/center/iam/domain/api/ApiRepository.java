package com.ark.center.iam.domain.api;

import com.ark.component.ddd.domain.repository.BaseRepository;

import java.util.List;

public interface ApiRepository extends BaseRepository<Api, Long> {

    boolean existsByAppIdAndMethodAndUrl(Long excludeId, Long applicationId, String method, String url);

//    List<Api> selectByIds(List<Long> resourceIds);

    List<Api> byAppId(Long applicationId);

}
