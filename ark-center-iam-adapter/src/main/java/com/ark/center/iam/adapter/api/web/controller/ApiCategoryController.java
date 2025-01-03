package com.ark.center.iam.adapter.api.web.controller;

import com.ark.center.iam.application.api.ApiCategoryCommandHandler;
import com.ark.center.iam.application.api.ApiCategoryQueryService;
import com.ark.center.iam.client.api.command.ApiCategoryCommand;
import com.ark.center.iam.client.api.dto.ApiCategoryBaseDTO;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.groups.Default;

/**
 * <p>
 * api表 前端控制器
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Tag(name = "API类目服务", description = "API类目服务")
@RestController
@RequestMapping("/v1/api-categories")
@RequiredArgsConstructor
public class ApiCategoryController extends BaseController {

    private final ApiCategoryCommandHandler apiCategoryCommandHandler;
    private final ApiCategoryQueryService apiCategoryQueryService;

    @GetMapping("/api/categories")
    @Operation(summary = "分页列表")
    public MultiResponse<ApiCategoryBaseDTO> queryPages(Long applicationId) {
        return MultiResponse.ok(apiCategoryQueryService.queryPages(applicationId));
    }

    @PostMapping
    @Operation(summary = "新建API分类")
    public ServerResponse createApiCategory(@RequestBody @Validated({ValidateGroup.Add.class, Default.class}) ApiCategoryCommand command) {
        apiCategoryCommandHandler.createApiCategory(command);
        return ServerResponse.ok();
    }

    @PutMapping
    @Operation(summary = "更新API分类")
    public ServerResponse updateApiCategory(@RequestBody @Validated({ValidateGroup.Update.class, Default.class}) ApiCategoryCommand command) {
        apiCategoryCommandHandler.updateApiCategory(command);
        return ServerResponse.ok();
    }

    @DeleteMapping("/api/category/delete")
    @Operation(summary = "删除分类")
    public ServerResponse delete(Long id) {
        apiCategoryCommandHandler.deleteApiCategory(id);
        return ServerResponse.ok();
    }

}

