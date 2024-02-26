package com.ark.center.iam.client.user;

import com.ark.center.iam.model.user.dto.UserInnerDTO;
import com.ark.center.iam.model.user.query.UserQuery;
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
@Schema(description = "用户-查询")
public interface UserQueryApi {

    @GetMapping("/info")
    @Operation(summary = "查询用户信息（只包含基础信息）")
    SingleResponse<UserInnerDTO> queryBasicInfo(@SpringQueryMap UserQuery userQuery);


}
