package com.ark.center.iam.adapter.api.web.controller;


import com.ark.center.iam.application.api.ApiCategoryAppService;
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
@Tag(name = "API类目管理", description = "API类目管理")
@RestController
@RequestMapping("/v1")
@RequiredArgsConstructor
public class ApiCategoryController extends BaseController {

    private final ApiCategoryAppService apiCategoryAppService;

    @GetMapping("/api/categories")
    @Operation(summary = "API类目管理 - 分页列表")
    public MultiResponse<ApiCategoryBaseDTO> queryList(Long applicationId) {
        return MultiResponse.ok(apiCategoryAppService.queryList(applicationId));
    }

    @PostMapping("/api/category/create")
    @Operation(summary = "API类目管理 - 新建类目")
    public ServerResponse save(@Validated({ValidateGroup.Add.class, Default.class})
                               @RequestBody ApiCategoryCmd dto) {
        apiCategoryAppService.createApiCategory(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/api/category/update")
    @Operation(summary = "API类目管理 - 更新类目")
    public ServerResponse update(@Validated({ValidateGroup.Update.class, Default.class})
                                 @RequestBody ApiCategoryCmd dto) {
        apiCategoryAppService.updateApiCategory(dto);
        return ServerResponse.ok();
    }

    @DeleteMapping("/api/category")
    @Operation(summary = "API类目管理 - 删除类目")
    public ServerResponse delete(Long id) {
        apiCategoryAppService.deleteApiCategory(id);
        return ServerResponse.ok();
    }

}

