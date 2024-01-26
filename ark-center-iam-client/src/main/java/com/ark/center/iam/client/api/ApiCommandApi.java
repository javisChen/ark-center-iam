package com.ark.center.iam.client.api;

import com.ark.center.iam.client.api.command.ApiCreateCommand;
import com.ark.center.iam.client.api.command.ApiStatusUpdateCommand;
import com.ark.center.iam.client.api.command.ApiUpdateCommand;
import com.ark.center.iam.client.api.dto.ApiDetailDTO;
import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.client.api.query.ApiQuery;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.microservice.rpc.exception.FeignCommonErrorDecoder;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Schema;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.cloud.openfeign.SpringQueryMap;
import org.springframework.web.bind.annotation.*;

@FeignClient(
        name = "${ark.center.iam.service.name:iam}",
        path = "/v1/apis",
        url = "${ark.center.iam.service.uri:}",
        dismiss404 = true,
        configuration = FeignCommonErrorDecoder.class
)
@Schema(description = "API-命令接口")
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
