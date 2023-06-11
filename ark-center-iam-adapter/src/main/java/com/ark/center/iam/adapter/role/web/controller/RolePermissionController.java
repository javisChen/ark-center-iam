package com.ark.center.iam.adapter.role.web.controller;

import com.ark.center.iam.application.role.RolePermissionAppService;
import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.client.role.command.RoleApiPermissionUpdateDTO;
import com.ark.center.iam.client.role.command.RoleApplicationApiPermissionUpdateDTO;
import com.ark.center.iam.client.role.command.RoleRoutePermissionGrantCmd;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Schema(name = "角色权限管理", description = "角色权限管理")
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1")
public class RolePermissionController extends BaseController {

    private final RolePermissionAppService rolePermissionAppService;

    /**
     * 角色路由权限授权
     * /role/permission/user/
     * /role/permission/1/
     */
    @PostMapping("/role/permission/grant")
    public ServerResponse updateRoleRoutePermissions(@RequestBody RoleRoutePermissionGrantCmd cmd) {
        rolePermissionAppService.grantRoutes(cmd);
        return ServerResponse.ok();
    }

    /**
     * 获取角色拥有的路由权限
     */
    @GetMapping("/role/permission/routes")
    public MultiResponse<PermissionDTO> getRoleRoutePermission(Long roleId, Long applicationId) {
        List<PermissionDTO> vos = rolePermissionAppService.queryRoleRoutesPermissions(roleId, applicationId);
        return MultiResponse.ok(vos);
    }

    /**
     * 角色api权限授权
     */
    @PostMapping("/role/permission/api")
    public ServerResponse updateRoleApiPermissions(@RequestBody RoleApiPermissionUpdateDTO dto) {
        rolePermissionAppService.grantApis(dto);
        return ServerResponse.ok();
    }

    /**
     * 角色api权限授权（直接授予应用下的所有api）
     */
    @PostMapping("/role/permission/application/api")
    public ServerResponse updateRoleApiPermissions(@RequestBody RoleApplicationApiPermissionUpdateDTO dto) {
//        iRoleService.updateRoleApiPermissions(dto);
//        rolePermissionAppService.grantApis(dto);
        return ServerResponse.ok();
    }

    /**
     * 获取角色拥有的Api权限
     */
    @GetMapping("/role/permission/apis")
    public MultiResponse<PermissionDTO> getRoleApiPermission(Long roleId, Long applicationId) {
        List<PermissionDTO> vos = rolePermissionAppService.queryRoleApiPermissions(roleId, applicationId);
        return MultiResponse.ok(vos);
    }

    /**
     * 获取角色拥有的页面元素权限
     */
    @GetMapping("/role/permission/elements")
    public MultiResponse<PermissionDTO> getRoleElementPermission(Long roleId, Long applicationId) {
        List<PermissionDTO> vos = rolePermissionAppService.queryRoleElementPermissions(roleId, applicationId);
        return MultiResponse.ok(vos);
    }
}

