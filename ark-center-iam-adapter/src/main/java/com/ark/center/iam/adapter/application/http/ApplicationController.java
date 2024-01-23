package com.ark.center.iam.adapter.application.http;

import com.ark.center.iam.application.application.ApplicationQueryService;
import com.ark.center.iam.application.application.ApplicationCommandService;
import com.ark.center.iam.client.application.command.ApplicationCreateCommand;
import com.ark.center.iam.client.application.command.ApplicationUpdateCommand;
import com.ark.center.iam.client.application.query.dto.ApplicationDTO;
import com.ark.center.iam.client.application.query.ApplicationQuery;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@Tag(name = "应用管理", description = "应用管理")
@RequiredArgsConstructor
@RestController
@RequestMapping
public class ApplicationController extends BaseController {

    private final ApplicationCommandService applicationCommandService;

    private final ApplicationQueryService applicationQueryService;

    @GetMapping("/v1/applications")
    @Operation(summary = "查询应用列表")
    public MultiResponse<ApplicationDTO> queryList(@RequestBody ApplicationQuery query) {
        return MultiResponse.ok(applicationQueryService.queryList(query));
    }

    @PostMapping("/v1/applications")
    @Operation(summary = "创建应用")
    public ServerResponse createApplication(@RequestBody ApplicationCreateCommand command) {
        applicationCommandService.handleCreate(command);
        return ServerResponse.ok();
    }

    @PutMapping("/v1/applications")
    @Operation(summary = "更新应用")
    public ServerResponse updateApplication(@RequestBody ApplicationUpdateCommand command) {
        applicationCommandService.handleUpdate(command);
        return ServerResponse.ok();
    }

}

