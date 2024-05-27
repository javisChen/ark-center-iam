package com.ark.center.iam.client.user;

import com.ark.center.iam.client.user.dto.UserApiPermissionDTO;
import com.ark.center.iam.client.user.query.UserPermissionQry;
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
@Schema(description = "用户权限管理-内部调用接口")
public interface UserPermissionQryApi {

    @GetMapping("/has-api-permission")
    @Operation(summary = "用户管理（内部调用） - 查询用户是否具备API访问权限")
    SingleResponse<Boolean> hasApiPermission(@SpringQueryMap UserPermissionQry userPermissionQry);

    @GetMapping("/api-permission")
    @Operation(summary = "用户管理（内部调用） - 查询用户拥有的API权限")
    MultiResponse<UserApiPermissionDTO> getApiPermissions(@RequestParam("userId") Long userId);

}
