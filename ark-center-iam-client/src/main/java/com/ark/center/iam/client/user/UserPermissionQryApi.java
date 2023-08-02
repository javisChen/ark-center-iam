package com.ark.center.iam.client.user;

import com.ark.center.iam.client.user.query.UserPermissionQry;
import com.ark.component.dto.SingleResponse;
import com.ark.component.microservice.rpc.exception.FeignCommonErrorDecoder;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.cloud.openfeign.SpringQueryMap;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(
        name = "${ark.center.iam.service.name:iam}",
        path = "/v1/inner/users/permissions",
        url = "${ark.center.iam.service.uri:}",
        dismiss404 = true,
        configuration = FeignCommonErrorDecoder.class
)
public interface UserPermissionQryApi {

    @GetMapping
    @Operation(summary = "用户管理（内部调用） - 查询用户是否具备API访问权限")
    SingleResponse<Boolean> checkApiHasPermission(@SpringQueryMap UserPermissionQry userPermissionQry);

}
