package com.ark.center.iam.adapter.role.http.controller;


import com.ark.center.iam.application.role.RoleCommandHandler;
import com.ark.center.iam.application.role.RoleQueryService;
import com.ark.center.iam.model.role.command.RoleCreateCommand;
import com.ark.center.iam.model.role.command.RoleUpdateCommand;
import com.ark.center.iam.model.role.dto.RoleBaseDTO;
import com.ark.center.iam.model.role.query.RoleQuery;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.PageResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Tag(name = "角色管理", description = "角色管理")
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1/roles")
public class RoleController extends BaseController {

    private final RoleQueryService roleQueryService;
    private final RoleCommandHandler roleCommandHandler;

    @GetMapping("")
    @Operation(summary = "分页查询")
    public SingleResponse<PageResponse<RoleBaseDTO>> queryPages(RoleQuery dto) {
        return SingleResponse.ok(PageResponse.of(roleQueryService.queryPages(dto)));
    }

    @GetMapping("/all")
    @Operation(summary = "全量查询")
    public MultiResponse<RoleBaseDTO> queryAll() {
        return MultiResponse.ok(roleQueryService.queryAll());
    }

    @PostMapping("")
    @Operation(summary = "创建角色")
    public ServerResponse createRole(@RequestBody @Validated RoleCreateCommand command) {
        roleCommandHandler.createRole(command);
        return ServerResponse.ok();
    }

    @PutMapping("")
    @Operation(summary = "更新角色")
    public ServerResponse updateRole(@RequestBody @Validated RoleUpdateCommand command) {
        roleCommandHandler.updateRole(command);
        return ServerResponse.ok();
    }

    @GetMapping("/details")
    @Operation(
            summary = "角色详情",
            description = "根据id查询角色详细信息",
            parameters = {@Parameter(name = "id", description = "角色id")}
    )
    public SingleResponse<RoleBaseDTO> queryDetails(Long id) {
        RoleBaseDTO vo = roleQueryService.queryDetails(id);
        return SingleResponse.ok(vo);
    }

    @DeleteMapping("")
    @Operation(summary = "删除角色")
    public ServerResponse removeRole(Long id) {
        roleCommandHandler.removeRole(id);
        return ServerResponse.ok();
    }

}

