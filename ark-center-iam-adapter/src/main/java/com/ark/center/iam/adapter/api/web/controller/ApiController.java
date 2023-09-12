package com.ark.center.iam.adapter.api.web.controller;

import com.ark.center.iam.application.api.ApiAppService;
import com.ark.center.iam.client.api.command.ApiEnableCmd;
import com.ark.center.iam.client.api.command.ApiSyncCmd;
import com.ark.center.iam.client.api.command.ApiUpdateCmd;
import com.ark.center.iam.client.api.dto.ApiDetailDTO;
import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.client.api.query.ApiQry;
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
@RequestMapping("/v1")
@RequiredArgsConstructor
public class ApiController extends BaseController {

    private final ApiAppService apiAppService;

    @Operation(summary = "API列表（全量）")
    @GetMapping("/apis")
    public MultiResponse<ApiDetailsDTO> queryList(ApiQry dto) {
        return MultiResponse.ok(apiAppService.queryList(dto));
    }

    @Operation(summary = "创建API")
    @PostMapping("/api")
    public ServerResponse saveApi(@Validated({ValidateGroup.Add.class, Default.class})
                                  @RequestBody ApiUpdateCmd dto) {
        apiAppService.createApplication(dto);
        return ServerResponse.ok();
    }

    @Operation(summary = "查询API详情")
    @GetMapping("/api")
    public SingleResponse<ApiDetailDTO> getApi(Long id) {
        ApiDetailDTO vo = apiAppService.getApi(id);
        return SingleResponse.ok(vo);
    }

    @Operation(summary = "更新API")
    @PutMapping("/api")
    public ServerResponse updateApi(@Validated({ValidateGroup.Update.class, Default.class})
                                    @RequestBody ApiUpdateCmd dto) {
        apiAppService.updateApi(dto);
        return ServerResponse.ok();
    }

    @Operation(summary = "启用/禁用")
    @PostMapping("/api/enable")
    public ServerResponse enable(@RequestBody ApiEnableCmd dto) {
        apiAppService.enableOrDisable(dto);
        return ServerResponse.ok();
    }

    @Operation(summary = "删除单个接口")
    @DeleteMapping("/api/{id}")
    public ServerResponse deleteApi(@PathVariable Long id) {
        apiAppService.deleteApi(id);
        return ServerResponse.ok();
    }

    @Operation(summary = "同步API", description = "同步服务API")
    @PostMapping("/api/sync")
    public ServerResponse syncApi(@RequestBody ApiSyncCmd cmd) {
        apiAppService.syncApi(cmd);
        return ServerResponse.ok();
    }

}

