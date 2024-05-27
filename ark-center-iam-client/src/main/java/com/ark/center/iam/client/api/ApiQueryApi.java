package com.ark.center.iam.client.api;

import com.ark.center.iam.client.api.dto.ApiDetailDTO;
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

@FeignClient(
        name = "${ark.center.iam.service.name:iam}",
        path = "/v1/apis",
        url = "${ark.center.iam.service.uri:}",
        dismiss404 = true,
        configuration = FeignCommonErrorDecoder.class
)
@Schema(description = "API管理-内部调用")
public interface ApiQueryApi {

    @GetMapping("/all")
    @Operation(summary = "全量查询Api")
    MultiResponse<ApiDetailsDTO> queryAll(@SpringQueryMap ApiQuery apiQuery);

    @Operation(summary = "查询Api详情")
    @GetMapping("/details")
    SingleResponse<ApiDetailDTO> getApi(Long id);
}
