package com.ark.center.iam.adapter.apicategory.http;


import com.ark.center.iam.application.apicategory.ApiCategoryCommandHandler;
import com.ark.center.iam.application.apicategory.ApiCategoryQueryService;
import com.ark.center.iam.client.apicategory.command.ApiCategoryCreateCommand;
import com.ark.center.iam.client.apicategory.command.ApiCategoryUpdateCommand;
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

@Tag(name = "API分类", description = "API分类")
@RestController
@RequestMapping("/v1")
@RequiredArgsConstructor
public class ApiCategoryController extends BaseController {

    private final ApiCategoryCommandHandler apiCategoryCommandHandler;

    private final ApiCategoryQueryService apiCategoryQueryService;

    @GetMapping("/api/categories")
    @Operation(summary = "分页列表")
    public MultiResponse<ApiCategoryBaseDTO> queryList(Long applicationId) {
        return MultiResponse.ok(apiCategoryQueryService.queryAll(applicationId));
    }

    @PostMapping("/api/categories")
    @Operation(summary = "新建分类")
    public ServerResponse create(@Validated({ValidateGroup.Add.class, Default.class})
                               @RequestBody ApiCategoryCreateCommand dto) {
        apiCategoryCommandHandler.handleCreate(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/api/categories")
    @Operation(summary = "更新分类")
    public ServerResponse update(@RequestBody ApiCategoryUpdateCommand dto) {
        apiCategoryCommandHandler.handleUpdate(dto);
        return ServerResponse.ok();
    }

    @DeleteMapping("/api/category/delete")
    @Operation(summary = "删除分类")
    public ServerResponse delete(Long id) {
        apiCategoryCommandHandler.handleDelete(id);
        return ServerResponse.ok();
    }

}

