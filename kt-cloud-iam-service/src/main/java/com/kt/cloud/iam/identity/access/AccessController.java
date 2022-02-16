package com.kt.cloud.iam.identity.access;

import com.kt.cloud.iam.api.access.AccessApi;
import com.kt.cloud.iam.api.access.request.ApiAccessRequest;
import com.kt.cloud.iam.api.access.response.ApiAccessResponse;
import com.kt.component.dto.SingleResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 访问权限控制器
 */
@RestController
@RequestMapping("/v1/access")
public class AccessController implements AccessApi {

    private final AccessService accessService;

    public AccessController(AccessService accessService) {
        this.accessService = accessService;
    }

    @Override
    public SingleResponse<ApiAccessResponse> getApiAccess(ApiAccessRequest request) {
        return accessService.getApiAccess(request);
    }

}
