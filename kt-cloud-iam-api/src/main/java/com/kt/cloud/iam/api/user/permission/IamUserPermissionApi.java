package com.kt.cloud.iam.api.user.permission;

import com.kt.cloud.iam.api.user.permission.request.AuthRequest;
import com.kt.cloud.iam.api.user.permission.response.AuthResponse;
import com.kt.component.dto.SingleResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(
        value = "${kt.cloud.iam.service.name:kt-cloud-iam}",
        path = "/v1",
        url = "${kt.cloud.iam.user.permission.url:}"
)
public interface IamUserPermissionApi {

    /**
     * 用户权限检查
     */
    @PostMapping("/user/permission/check")
    SingleResponse<AuthResponse> checkPermission(@RequestBody AuthRequest request);
}
