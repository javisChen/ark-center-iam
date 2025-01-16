package com.ark.center.iam.client.api;

import com.ark.center.iam.client.api.dto.ApiDTO;
import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.client.api.query.ApiQuery;
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
        path = "/v1/apis",
        url = "${ark.center.iam.service.uri:}",
        dismiss404 = true,
        configuration = FeignCommonErrorDecoder.class
)
@Schema(description = "API查询服务")
public interface ApiQueryApi {

    @GetMapping("/all")
    @Operation(
            summary = "查询API列表",
            description = "查询所有API接口信息，支持条件过滤"
    )
    MultiResponse<ApiDTO> queryAll(@SpringQueryMap ApiQuery query);

    @GetMapping("")
    @Operation(
            summary = "查询API列表",
            description = "查询所有API接口信息，支持条件过滤"
    )
    MultiResponse<ApiDetailsDTO> query(@SpringQueryMap ApiQuery query);

    @GetMapping("/details")
    @Operation(
        summary = "查询API详情",
        description = "根据API ID查询详细信息"
    )
    SingleResponse<ApiDTO> getApi(@RequestParam Long id);
}
