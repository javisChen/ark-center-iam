package com.ark.center.iam.client.user;

import com.ark.center.iam.client.user.dto.UserApiPermissionDTO;
import com.ark.center.iam.client.user.query.UserPermissionQuery;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.microservice.rpc.exception.FeignCommonErrorDecoder;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Schema;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.cloud.openfeign.SpringQueryMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(
        name = "${ark.center.iam.service.name:iam}",
        path = "/v1/users/permissions",
        url = "${ark.center.iam.service.uri:}",
        dismiss404 = true,
        configuration = FeignCommonErrorDecoder.class
)
@Schema(description = "用户权限查询服务")
public interface UserPermissionQueryApi {

    @GetMapping("/api/check")
    @Operation(
            summary = "校验用户API访问权限",
            description = "检查用户是否具备指定API的访问权限"
    )
    SingleResponse<Boolean> checkApiPermission(@SpringQueryMap UserPermissionQuery query);

    @GetMapping("/apis")
    @Operation(
            summary = "查询用户API权限列表",
            description = "获取用户被授权的所有API权限列表"
    )
    MultiResponse<UserApiPermissionDTO> queryUserApiPermissions(@RequestParam("userId") Long userId);

}
