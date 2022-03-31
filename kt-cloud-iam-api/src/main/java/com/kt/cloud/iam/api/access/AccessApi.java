package com.kt.cloud.iam.api.access;

import com.kt.cloud.iam.api.access.request.ApiAccessRequest;
import com.kt.cloud.iam.api.access.response.ApiAccessResponse;
import com.kt.component.dto.SingleResponse;
import com.kt.component.microservice.rpc.exception.FeignCommonErrorDecoder;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(
        value = "${kt.cloud.iam.service.name:iam123}",
        path = "/v1/access",
        url = "${kt.cloud.iam.authentication.url:}",
        decode404 = true,
        configuration = FeignCommonErrorDecoder.class
)
public interface AccessApi {

    /**
     * API访问权限校验
     */
    @PostMapping("/api")
    SingleResponse<ApiAccessResponse> getApiAccess(@RequestBody ApiAccessRequest request);
}
