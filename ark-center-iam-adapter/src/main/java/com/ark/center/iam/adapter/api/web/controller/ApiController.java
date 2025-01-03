package com.ark.center.iam.adapter.api.web.controller;

import com.ark.center.iam.application.api.ApiCommandHandler;
import com.ark.center.iam.application.api.ApiQueryService;
import com.ark.center.iam.client.api.ApiQueryApi;
import com.ark.center.iam.client.api.command.ApiEnableCommand;
import com.ark.center.iam.client.api.command.ApiSyncCommand;
import com.ark.center.iam.client.api.command.ApiCommand;
import com.ark.center.iam.client.api.dto.ApiDetailDTO;
import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.client.api.query.ApiQuery;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.groups.Default;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Tag(name = "API服务", description = "API服务")
@RestController
@RequestMapping("/v1/apis")
@RequiredArgsConstructor
public class ApiController extends BaseController implements ApiQueryApi {

    private final ApiCommandHandler apiCommandHandler;
    private final ApiQueryService apiQueryService;

    @Override
    @Operation(
        summary = "查询API列表",
        description = "查询所有API接口信息，支持条件过滤"
    )
    public MultiResponse<ApiDetailsDTO> query(ApiQuery query) {
        return MultiResponse.ok(apiQueryService.query(query));
    }

    @PostMapping
    @Operation(
        summary = "创建API",
        description = "创建新的API接口"
    )
    public ServerResponse saveApi(@Validated({ValidateGroup.Add.class, Default.class})
                                  @RequestBody ApiCommand command) {
        apiCommandHandler.save(command);
        return ServerResponse.ok();
    }

    @Override
    @Operation(
        summary = "查询API详情",
        description = "根据API ID查询详细信息"
    )
    public SingleResponse<ApiDetailDTO> getApi(@RequestParam Long id) {
        return SingleResponse.ok(apiQueryService.getApi(id));
    }

    @PutMapping
    @Operation(
        summary = "更新API",
        description = "更新已有的API接口信息"
    )
    public ServerResponse updateApi(@Validated({ValidateGroup.Update.class, Default.class})
                                    @RequestBody ApiCommand command) {
        apiCommandHandler.updateApi(command);
        return ServerResponse.ok();
    }

    @PostMapping("/enable")
    @Operation(
        summary = "启用/禁用API",
        description = "修改API的启用状态"
    )
    public ServerResponse enable(@RequestBody ApiEnableCommand command) {
        apiCommandHandler.enableOrDisable(command);
        return ServerResponse.ok();
    }

    @DeleteMapping
    @Operation(
        summary = "删除API",
        description = "根据ID删除API接口"
    )
    public ServerResponse deleteApi(@RequestParam Long id) {
        apiCommandHandler.deleteApi(id);
        return ServerResponse.ok();
    }

    @PostMapping("/sync")
    @Operation(
        summary = "同步API",
        description = "同步更新服务的API信息"
    )
    public ServerResponse syncApi(@RequestBody ApiSyncCommand command) {
        apiCommandHandler.syncApi(command);
        return ServerResponse.ok();
    }
}

