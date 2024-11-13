package com.ark.center.iam.adapter.api.web.controller;


import com.ark.center.iam.application.api.ApiCategoryCommandHandler;
import com.ark.center.iam.application.api.ApiCategoryQueryService;
import com.ark.center.iam.client.api.command.ApiCategoryCmd;
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
@Tag(name = "API分类", description = "API分类")
@RestController
@RequestMapping("/v1")
@RequiredArgsConstructor
public class ApiCategoryController extends BaseController {

    private final ApiCategoryCommandHandler apiCategoryCommandHandler;
    private final ApiCategoryQueryService apiCategoryQueryService;

    @GetMapping("/api/categories")
    @Operation(summary = "分页列表")
    public MultiResponse<ApiCategoryBaseDTO> queryPages(Long applicationId) {
        return MultiResponse.ok(apiCategoryQueryService.queryPages(applicationId));
    }

    @PostMapping("/api/category/create")
    @Operation(summary = "新建分类")
    public ServerResponse save(@Validated({ValidateGroup.Add.class, Default.class})
                               @RequestBody ApiCategoryCmd dto) {
        apiCategoryCommandHandler.createApiCategory(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/api/category/update")
    @Operation(summary = "更新分类")
    public ServerResponse update(@Validated({ValidateGroup.Update.class, Default.class})
                                 @RequestBody ApiCategoryCmd dto) {
        apiCategoryCommandHandler.updateApiCategory(dto);
        return ServerResponse.ok();
    }

    @DeleteMapping("/api/category/delete")
    @Operation(summary = "删除分类")
    public ServerResponse delete(Long id) {
        apiCategoryCommandHandler.deleteApiCategory(id);
        return ServerResponse.ok();
    }

}

