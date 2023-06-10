package com.ark.center.iam.domain.api.gateway;

import com.ark.center.iam.client.api.dto.ApiListDTO;
import com.ark.center.iam.client.api.query.ApiQry;
import com.ark.center.iam.domain.api.Api;

import java.util.List;

public interface ApiGateway {

    List<ApiListDTO> selectList(ApiQry apiQry);

    Api selectApiByApplicationIdAndMethodAndUrl(Long applicationId, String method, String url);

    void insert(Api api);

    Api selectById(Long id);

    void update(Api apiUpdate);

    void delete(Long id);

}
