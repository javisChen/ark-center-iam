package com.ark.center.iam.client.api;

import com.ark.center.iam.model.api.command.ApiCreateCommand;
import com.ark.center.iam.model.api.command.ApiStatusUpdateCommand;
import com.ark.center.iam.model.api.command.ApiUpdateCommand;
import com.ark.component.dto.ServerResponse;
import com.ark.component.microservice.rpc.exception.FeignCommonErrorDecoder;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(
        name = "${ark.center.iam.service.name:iam}",
        path = "/v1/apis",
        url = "${ark.center.iam.service.uri:}",
        dismiss404 = true,
        configuration = FeignCommonErrorDecoder.class
)
public interface ApiCommandApi {

    @Operation(summary = "新建Api")
    @PostMapping
    ServerResponse createApi(@RequestBody ApiCreateCommand dto);

    @Operation(summary = "更新API")
    @PutMapping
    ServerResponse updateApi(@RequestBody ApiUpdateCommand dto);

    @Operation(summary = "启用/禁用Api")
    @PutMapping("/status")
    ServerResponse changeStatus(@RequestBody ApiStatusUpdateCommand dto);

    @Operation(summary = "删除单个接口")
    @DeleteMapping("/api")
    ServerResponse deleteApi(Long id);
}
