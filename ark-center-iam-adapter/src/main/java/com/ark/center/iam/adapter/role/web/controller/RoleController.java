package com.ark.center.iam.adapter.role.web.controller;


import com.ark.center.iam.application.role.RoleAppService;
import com.ark.center.iam.data.role.service.IRoleService;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.PageResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import com.ark.center.iam.client.role.query.RoleQry;
import com.ark.center.iam.client.role.command.RoleUpdateDTO;
import com.ark.center.iam.client.role.dto.RoleBaseDTO;
import com.ark.center.iam.client.role.dto.RoleListDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.groups.Default;
@Schema(name = "角色管理", description = "角色管理")
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1")
public class RoleController extends BaseController {

    private final IRoleService iRoleService;
    private final RoleAppService roleAppService;


    @PostMapping("/roles")
    public SingleResponse<PageResponse<RoleListDTO>> pageQuery(@RequestBody RoleQry dto) {
        return SingleResponse.ok(PageResponse.of(roleAppService.pageQuery(dto)));
        return SingleResponse.ok(PageResponse.of(iRoleService.pageList(dto)));
    }

    @GetMapping("/roles/all")
    public MultiResponse<RoleListDTO> listAll() {
        return MultiResponse.ok(iRoleService.listAllVos());
    }

    @PostMapping("/role")
    public ServerResponse add(@RequestBody @Validated RoleUpdateDTO dto) {
        iRoleService.saveRole(dto);
        return ServerResponse.ok();
    }

    @PutMapping("/role")
    public ServerResponse update(@RequestBody @Validated RoleUpdateDTO dto) {
        iRoleService.updateRoleById(dto);
        return ServerResponse.ok();
    }

    @GetMapping("/role")
    public SingleResponse<RoleBaseDTO> get(String id) {
        RoleBaseDTO vo = iRoleService.getRoleVoById(id);
        return SingleResponse.ok(vo);
    }

    @DeleteMapping("/role")
    public ServerResponse removeRole(Long id) {
        iRoleService.removeRoleById(id);
        return ServerResponse.ok();
    }

    @PutMapping("/role/status")
    public ServerResponse updateStatus(@Validated({ValidateGroup.Update.class, Default.class})
                                       @RequestBody RoleUpdateDTO dto) {
        iRoleService.updateStatus(dto);
        return ServerResponse.ok();
    }
}

