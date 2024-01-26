package com.ark.center.iam.adapter.api.http.controller;

import com.ark.center.iam.application.api.ApiCommandHandler;
import com.ark.center.iam.application.api.ApiQueryService;
import com.ark.center.iam.client.api.ApiCommandApi;
import com.ark.center.iam.client.api.ApiQueryApi;
import com.ark.center.iam.client.api.command.ApiCreateCommand;
import com.ark.center.iam.client.api.command.ApiStatusUpdateCommand;
import com.ark.center.iam.client.api.command.ApiSyncCmd;
import com.ark.center.iam.client.api.command.ApiUpdateCommand;
import com.ark.center.iam.client.api.dto.ApiDetailDTO;
import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.client.api.query.ApiQuery;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@Tag(name = "API管理", description = "API管理")
@RestController
@RequestMapping("/v1/apis")
@RequiredArgsConstructor
public class ApiController implements ApiQueryApi, ApiCommandApi {

    private final ApiCommandHandler apiCommandHandler;

    private final ApiQueryService apiQueryService;

    @Override
    public MultiResponse<ApiDetailsDTO> queryAll(ApiQuery query) {
        return MultiResponse.ok(apiQueryService.queryAll(query));
    }

    @Override
    public ServerResponse createApi(@RequestBody ApiCreateCommand dto) {
        apiCommandHandler.createApi(dto);
        return ServerResponse.ok();
    }

    @Override
    public ServerResponse updateApi(@RequestBody ApiUpdateCommand dto) {
        apiCommandHandler.updateApi(dto);
        return ServerResponse.ok();
    }

    @Override
    public SingleResponse<ApiDetailDTO> getApi(Long id) {
        ApiDetailDTO vo = apiCommandHandler.getApi(id);
        return SingleResponse.ok(vo);
    }

    @Operation(summary = "启用/禁用Api")
    @PutMapping("/status")
    @Override
    public ServerResponse changeStatus(@RequestBody ApiStatusUpdateCommand dto) {
        apiCommandHandler.handleChangeStatus(dto);
        return ServerResponse.ok();
    }

    @Operation(summary = "删除单个接口")
    @DeleteMapping
    @Override
    public ServerResponse deleteApi(Long id) {
        apiCommandHandler.deleteApi(id);
        return ServerResponse.ok();
    }

    @Operation(summary = "同步API", description = "同步服务API")
    @PostMapping("/api/sync")
    public ServerResponse syncApi(@RequestBody ApiSyncCmd cmd) {
        apiCommandHandler.syncApi(cmd);
        return ServerResponse.ok();
    }

}

