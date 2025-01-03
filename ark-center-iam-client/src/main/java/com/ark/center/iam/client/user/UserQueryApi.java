package com.ark.center.iam.client.user;

import com.ark.center.iam.client.user.dto.UserAuthDTO;
import com.ark.center.iam.client.user.query.UserQuery;
import com.ark.component.dto.SingleResponse;
import com.ark.component.microservice.rpc.exception.FeignCommonErrorDecoder;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Schema;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.cloud.openfeign.SpringQueryMap;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(
        name = "${ark.center.iam.service.name:iam}",
        path = "/v1/users",
        url = "${ark.center.iam.service.uri:}",
        dismiss404 = true,
        configuration = FeignCommonErrorDecoder.class
)
@Schema(description = "用户接口(查询）")
public interface UserQueryApi {

    @GetMapping("/auth")
    @Operation(summary = "查询用户信息（认证）")
    SingleResponse<UserAuthDTO> getUserForAuth(@SpringQueryMap UserQuery userQuery);


}
