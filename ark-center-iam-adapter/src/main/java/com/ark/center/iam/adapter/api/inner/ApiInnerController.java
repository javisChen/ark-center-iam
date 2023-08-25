package com.ark.center.iam.adapter.api.inner;

import com.ark.center.iam.application.api.ApiAppService;
import com.ark.center.iam.client.api.ApiQryApi;
import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.client.api.query.ApiQry;
import com.ark.component.dto.MultiResponse;
import com.ark.component.web.base.BaseController;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RequiredArgsConstructor
@RestController
@RequestMapping("/v1/inner/apis")
public class ApiInnerController extends BaseController implements ApiQryApi {

    private final ApiAppService apiAppService;

    @Override
    public MultiResponse<ApiDetailsDTO> queryApis(ApiQry apiQry) {
        return MultiResponse.ok(apiAppService.queryList(apiQry));
    }

}

