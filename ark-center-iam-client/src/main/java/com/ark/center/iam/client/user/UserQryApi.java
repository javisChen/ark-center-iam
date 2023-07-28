package com.ark.center.iam.client.user;

import com.ark.center.iam.client.user.dto.UserInnerDTO;
import com.ark.component.dto.SingleResponse;
import com.ark.component.microservice.rpc.exception.FeignCommonErrorDecoder;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(
        name = "${ark.center.iam.service.name:iam}",
        path = "/v1/inner/user",
        url = "${ark.center.iam.service.uri:}",
        dismiss404 = true,
        configuration = FeignCommonErrorDecoder.class
)
public interface UserQryApi {

    @GetMapping
    @Operation(summary = "用户管理（内部调用） - 查询单个用户")
    SingleResponse<UserInnerDTO> getUserByUserName(@RequestParam(name = "userName") String userName);

    @GetMapping
    @Operation(summary = "用户管理（内部调用） - 查询单个用户")
    SingleResponse<UserInnerDTO> getUserByPhone(@RequestParam(name = "phone") String phone);
}
