package com.ark.center.iam.adapter.role.web.controller;


import com.ark.center.iam.application.role.RoleAppService;
import com.ark.center.iam.client.role.command.RoleCmd;
import com.ark.center.iam.client.role.dto.RoleBaseDTO;
import com.ark.center.iam.client.role.query.RoleQry;
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

@Tag(name = "角色", description = "角色")
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1")
public class RoleController extends BaseController {

    private final RoleAppService roleAppService;

    @GetMapping("/roles")
    @Operation(summary = "分页查询")
    public SingleResponse<PageResponse<RoleBaseDTO>> pageQuery(RoleQry dto) {
        return SingleResponse.ok(PageResponse.of(roleAppService.pageQuery(dto)));
    }

    @GetMapping("/roles/all")
    @Operation(summary = "全量查询")
    public MultiResponse<RoleBaseDTO> queryList() {
        return MultiResponse.ok(roleAppService.queryList());
    }

    @PostMapping("/role/create")
    @Operation(summary = "创建角色")
    public ServerResponse createRole(@RequestBody @Validated RoleCmd dto) {
        roleAppService.createRole(dto);
        return ServerResponse.ok();
    }

    @PostMapping("/role/update")
    @Operation(summary = "更新角色")
    public ServerResponse updateRole(@RequestBody @Validated RoleCmd dto) {
        roleAppService.updateRole(dto);
        return ServerResponse.ok();
    }

    @GetMapping("/role")
    @Operation(
            summary = "角色详情",
            description = "根据id查询角色详细信息",
            parameters = {@Parameter(name = "id", description = "角色id")}
    )
    public SingleResponse<RoleBaseDTO> get(Long id) {
        RoleBaseDTO vo = roleAppService.queryRole(id);
        return SingleResponse.ok(vo);
    }

    @DeleteMapping("/role/delete")
    @Operation(summary = "删除角色")
    public ServerResponse removeRole(Long id) {
        roleAppService.removeRole(id);
        return ServerResponse.ok();
    }

}

