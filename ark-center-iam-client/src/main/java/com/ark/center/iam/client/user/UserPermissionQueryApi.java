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
        path = "/v1/users/permission",
        url = "${ark.center.iam.service.uri:}",
        dismiss404 = true,
        configuration = FeignCommonErrorDecoder.class
)
@Schema(description = "用户权限接口（查询）")
public interface UserPermissionQueryApi {

    @GetMapping("/has-api-permission")
    @Operation(summary = "用户管理（内部调用） - 查询用户是否具备API访问权限")
    SingleResponse<Boolean> hasApiPermission(@SpringQueryMap UserPermissionQuery userPermissionQuery);

    @GetMapping("/api-permission")
    @Operation(summary = "用户管理（内部调用） - 查询用户拥有的API权限")
    MultiResponse<UserApiPermissionDTO> queryApiPermissions(@RequestParam("userId") Long userId);

}
