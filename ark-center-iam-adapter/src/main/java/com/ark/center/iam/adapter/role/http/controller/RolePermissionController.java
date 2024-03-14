package com.ark.center.iam.adapter.role.http.controller;

import com.ark.center.iam.application.rolepermission.RolePermissionQueryService;
import com.ark.center.iam.application.rolepermission.RolePermissionCommandHandler;
import com.ark.center.iam.model.permission.vo.PermissionDTO;
import com.ark.center.iam.model.role.command.RoleApplicationApiPermissionUpdateCmd;
import com.ark.center.iam.model.role.command.RolePermissionGrantCmd;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name = "角色权限管理", description = "角色权限管理")
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1")
public class RolePermissionController extends BaseController {

    private final RolePermissionCommandHandler rolePermissionCommandHandler;
    private final RolePermissionQueryService rolePermissionQueryService;

    /**
     * 角色路由权限授权
     * /role/permission/user/
     * /role/permission/1/
     */
    @PostMapping("/role/permission/menus")
    @Operation(summary = "角色路由授权")
    public ServerResponse grantMenuPermissions(@RequestBody RolePermissionGrantCmd cmd) {
        rolePermissionCommandHandler.grantMenuPermission(cmd);
        return ServerResponse.ok();
    }

    /**
     * 角色api权限授权
     */
    @PostMapping("/role/permission/apis")
    @Operation(summary = "角色Api授权")
    public ServerResponse updateRoleApiPermissions(@RequestBody RolePermissionGrantCmd cmd) {
        rolePermissionCommandHandler.grantApiPermission(cmd);
        return ServerResponse.ok();
    }

    /**
     * 获取角色拥有的路由权限
     */
    @GetMapping("/role/permission/menus")
    @Operation(summary = "查询角色路由权限")
    public MultiResponse<PermissionDTO> queryRoleMenuPermissions(Long roleId, Long applicationId) {
        List<PermissionDTO> permissions = rolePermissionQueryService.queryRoleMenuPermissions(roleId, applicationId);
        return MultiResponse.ok(permissions);
    }

    /**
     * 角色api权限授权（直接授予应用下的所有api）
     */
    @PostMapping("/role/permission/application/api")
    public ServerResponse updateRoleApiPermissions(@RequestBody RoleApplicationApiPermissionUpdateCmd dto) {
//        iRoleService.updateRoleApiPermissions(dto);
//        rolePermissionAppService.grantApis(dto);
        return ServerResponse.ok();
    }

    /**
     * 获取角色拥有的Api权限
     */
    @GetMapping("/role/permission/apis")
    @Operation(summary = "查询角色Api权限")
    public MultiResponse<PermissionDTO> getRoleApiPermission(Long roleId, Long applicationId) {
        List<PermissionDTO> vos = rolePermissionQueryService.queryRoleApiPermissions(roleId, applicationId);
        return MultiResponse.ok(vos);
    }

    /**
     * 获取角色拥有的页面元素权限
     */
    @GetMapping("/role/permission/elements")
    @Operation(summary = "查询角色页面元素权限")
    public MultiResponse<PermissionDTO> getRoleElementPermission(Long roleId, Long applicationId) {
        List<PermissionDTO> vos = rolePermissionQueryService.queryRoleElementPermissions(roleId, applicationId);
        return MultiResponse.ok(vos);
    }
}

