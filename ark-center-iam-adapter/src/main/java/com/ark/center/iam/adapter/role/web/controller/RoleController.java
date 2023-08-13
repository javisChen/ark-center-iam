package com.ark.center.iam.adapter.role.web.controller;


import com.ark.center.iam.application.role.RoleAppService;
import com.ark.center.iam.client.role.command.RoleCmd;
import com.ark.center.iam.client.role.dto.RoleBaseDTO;
import com.ark.center.iam.client.role.query.RoleQry;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.PageResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.groups.Default;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
@Schema(name = "角色管理", description = "角色管理")
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1")
public class RoleController extends BaseController {

    private final RoleAppService roleAppService;


    @PostMapping("/roles")
    public SingleResponse<PageResponse<RoleBaseDTO>> pageQuery(@RequestBody RoleQry dto) {
        return SingleResponse.ok(PageResponse.of(roleAppService.pageQuery(dto)));
    }

    @GetMapping("/roles/all")
    public MultiResponse<RoleBaseDTO> queryList() {
        return MultiResponse.ok(roleAppService.queryList());
    }

    @PostMapping("/role/create")
    public ServerResponse createRole(@RequestBody @Validated RoleCmd dto) {
        roleAppService.createRole(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/role")
    public ServerResponse update(@RequestBody @Validated RoleCmd dto) {
        roleAppService.updateRole(dto);
        return ServerResponse.ok();
    }

    @GetMapping("/role")
    public SingleResponse<RoleBaseDTO> get(Long id) {
        RoleBaseDTO vo = roleAppService.queryRole(id);
        return SingleResponse.ok(vo);
    }

    @DeleteMapping("/role")
    public ServerResponse removeRole(Long id) {
        roleAppService.removeRole(id);
        return ServerResponse.ok();
    }

    @PutMapping("/role/status")
    public ServerResponse updateStatus(@Validated({ValidateGroup.Update.class, Default.class})
                                       @RequestBody RoleCmd dto) {
        roleAppService.updateStatus(dto);
        return ServerResponse.ok();
    }
}

