package com.ark.center.iam.adapter.api.web.controller;

import com.ark.center.iam.application.api.ApiCommandHandler;
import com.ark.center.iam.application.api.ApiQueryService;
import com.ark.center.iam.client.api.ApiQueryApi;
import com.ark.center.iam.client.api.command.ApiEnableCmd;
import com.ark.center.iam.client.api.command.ApiSyncCommand;
import com.ark.center.iam.client.api.command.ApiUpdateCmd;
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

@Tag(name = "API管理", description = "API管理")
@RestController
@RequestMapping("/v1/apis")
@RequiredArgsConstructor
public class ApiController extends BaseController implements ApiQueryApi {

    private final ApiCommandHandler apiCommandHandler;
    private final ApiQueryService apiQueryService;

    @Operation(summary = "API列表（全量）")
    public MultiResponse<ApiDetailsDTO> queryAll(ApiQuery dto) {
        return MultiResponse.ok(apiQueryService.queryList(dto));
    }

    @Operation(summary = "创建API")
    @PostMapping("")
    public ServerResponse saveApi(@Validated({ValidateGroup.Add.class, Default.class})
                                  @RequestBody ApiUpdateCmd dto) {
        apiCommandHandler.createApplication(dto);
        return ServerResponse.ok();
    }

    @Operation(summary = "查询API详情")
    @GetMapping("/details")
    public SingleResponse<ApiDetailDTO> getApi(@RequestParam Long id) {
        ApiDetailDTO vo = apiQueryService.getApi(id);
        return SingleResponse.ok(vo);
    }

    @Operation(summary = "更新API")
    @PutMapping("")
    public ServerResponse updateApi(@Validated({ValidateGroup.Update.class, Default.class})
                                    @RequestBody ApiUpdateCmd dto) {
        apiCommandHandler.updateApi(dto);
        return ServerResponse.ok();
    }

    @Operation(summary = "启用/禁用")
    @PostMapping("/api/enable")
    public ServerResponse enable(@RequestBody ApiEnableCmd dto) {
        apiCommandHandler.enableOrDisable(dto);
        return ServerResponse.ok();
    }

    @Operation(summary = "删除单个接口")
    @DeleteMapping("")
    public ServerResponse deleteApi(@RequestParam Long id) {
        apiCommandHandler.deleteApi(id);
        return ServerResponse.ok();
    }

    @Operation(summary = "同步API", description = "同步服务API")
    @PostMapping("/sync")
    public ServerResponse syncApi(@RequestBody ApiSyncCommand command) {
        apiCommandHandler.syncApi(command);
        return ServerResponse.ok();
    }

}

