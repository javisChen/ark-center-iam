package com.ark.center.iam.adapter.application.web;


import com.ark.center.iam.application.application.ApplicationCommandHandler;
import com.ark.center.iam.application.application.ApplicationQueryService;
import com.ark.center.iam.client.application.command.ApplicationCommand;
import com.ark.center.iam.client.application.dto.ApplicationDTO;
import com.ark.center.iam.client.application.query.ApplicationQuery;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.groups.Default;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 角色表 前端控制器
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Tag(name = "应用", description = "应用")
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1/applications")
public class ApplicationController extends BaseController {

    private final ApplicationCommandHandler applicationCommandHandler;

    private final ApplicationQueryService applicationQueryService;

    @GetMapping("")
    @Operation(summary = "查询应用列表")
    public MultiResponse<ApplicationDTO> queryList(ApplicationQuery query) {
        return MultiResponse.ok(applicationQueryService.queryList(query));
    }

    @PostMapping("")
    @Operation(summary = "创建应用")
    public ServerResponse createApplication(@RequestBody ApplicationCommand command) {
        applicationCommandHandler.save(command);
        return ServerResponse.ok();
    }

    @PutMapping("")
    @Operation(summary = "更新应用")
    public ServerResponse updateApplication(@RequestBody ApplicationCommand command) {
        applicationCommandHandler.save(command);
        return ServerResponse.ok();
    }

}

