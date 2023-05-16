package com.ark.center.iam.data.role.controller;


import com.ark.center.iam.data.role.service.IRoleService;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.PageResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import com.ark.center.iam.data.role.dto.RoleQueryDTO;
import com.ark.center.iam.data.role.dto.RoleUpdateDTO;
import com.ark.center.iam.data.role.vo.RoleBaseVO;
import com.ark.center.iam.data.role.vo.RoleListVO;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.groups.Default;

/**
 * <p>
 * 角色表 前端控制器
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@RestController
@RequestMapping("/v1")
public class RoleController extends BaseController {

    private final IRoleService iRoleService;

    public RoleController(IRoleService iRoleService) {
        this.iRoleService = iRoleService;
    }

    @PostMapping("/roles")
    public SingleResponse<PageResponse<RoleListVO>> list(@RequestBody RoleQueryDTO dto) {
        return SingleResponse.ok(PageResponse.of(iRoleService.pageList(dto)));
    }

    @GetMapping("/roles/all")
    public MultiResponse<RoleListVO> listAll() {
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
    public SingleResponse<RoleBaseVO> get(String id) {
        RoleBaseVO vo = iRoleService.getRoleVoById(id);
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

