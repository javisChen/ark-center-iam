package com.kt.cloud.iam.api.access;

import com.kt.cloud.iam.api.access.request.ApiAccessRequest;
import com.kt.cloud.iam.api.access.response.ApiAccessResponse;
import com.kt.cloud.iam.api.user.permission.FeignExceptionConfiguration;
import com.kt.component.dto.SingleResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(
        value = "${kt.cloud.iam.service.name:iam}",
        path = "/v1/access",
        url = "${kt.cloud.iam.authentication.url:}",
        decode404 = true,
        configuration = FeignExceptionConfiguration.class
)
public interface AccessApi {

    /**
     * API访问权限校验
     */
    @PostMapping("/api")
    SingleResponse<ApiAccessResponse> getApiAccess(@RequestBody ApiAccessRequest request);
}
