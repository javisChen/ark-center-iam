package com.ark.center.iam.adapter.api.web.controller;

import com.ark.center.iam.application.api.ApiCommandHandler;
import com.ark.center.iam.application.api.ApiQueryService;
import com.ark.center.iam.client.api.ApiQueryApi;
import com.ark.center.iam.client.api.command.ApiCommand;
import com.ark.center.iam.client.api.command.ApiEnableCommand;
import com.ark.center.iam.client.api.command.ApiSyncCommand;
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

@Tag(name = "测试服务", description = "测试服务")
@RestController
@RequestMapping("/v1/test")
@RequiredArgsConstructor
public class TestController extends BaseController {

    private final ApiCommandHandler apiCommandHandler;
    private final ApiQueryService apiQueryService;

    @GetMapping("/detail")
    public SingleResponse<String> query(ApiQuery query) {
        return SingleResponse.ok("detail");
    }

    @PostMapping("/{id}")
    public SingleResponse<String> query(@PathVariable String id) {
        return SingleResponse.ok(id + "-path");
    }

}

