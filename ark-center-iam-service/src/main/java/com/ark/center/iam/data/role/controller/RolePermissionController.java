package com.ark.center.iam.data.role.controller;

import com.ark.center.iam.client.role.command.RoleApiPermissionUpdateDTO;
import com.ark.center.iam.client.role.command.RoleApplicationApiPermissionUpdateDTO;
import com.ark.center.iam.data.role.service.IRoleService;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.web.base.BaseController;
import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.client.role.command.RoleRoutePermissionUpdateDTO;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
public class RolePermissionController extends BaseController {

    private final IRoleService iRoleService;

    public RolePermissionController(IRoleService iRoleService) {
        this.iRoleService = iRoleService;
    }

    /**
     * 角色路由权限授权
     * /role/permission/user/
     * /role/permission/1/
     */
    @PostMapping("/role/permission/grant")
    public ServerResponse updateRoleRoutePermissions(@RequestBody RoleRoutePermissionUpdateDTO dto) {
        iRoleService.updateRoleRoutePermissions(dto);
        return ServerResponse.ok();
    }

    /**
     * 获取角色拥有的路由权限
     */
    @GetMapping("/role/permission/routes")
    public MultiResponse<PermissionDTO> getRoleRoutePermission(Long roleId, Long applicationId) {
        List<PermissionDTO> vos = iRoleService.getRoleRoutePermissionById(roleId, applicationId);
        return MultiResponse.ok(vos);
    }

    /**
     * 角色api权限授权
     */
    @PostMapping("/role/permission/api")
    public ServerResponse updateRoleApiPermissions(@RequestBody RoleApiPermissionUpdateDTO dto) {
        iRoleService.updateRoleApiPermissions(dto);
        return ServerResponse.ok();
    }

    /**
     * 角色api权限授权（直接授予应用下的所有api）
     */
    @PostMapping("/role/permission/application/api")
    public ServerResponse updateRoleApiPermissions(@RequestBody RoleApplicationApiPermissionUpdateDTO dto) {
        iRoleService.updateRoleApiPermissions(dto);
        return ServerResponse.ok();
    }

    /**
     * 获取角色拥有的Api权限
     */
    @GetMapping("/role/permission/apis")
    public MultiResponse<PermissionDTO> getRoleApiPermission(Long roleId, Long applicationId) {
        List<PermissionDTO> vos = iRoleService.getRoleApiPermissionById(roleId, applicationId);
        return MultiResponse.ok(vos);
    }

    /**
     * 获取角色拥有的页面元素权限
     */
    @GetMapping("/role/permission/elements")
    public MultiResponse<PermissionDTO> getRoleElementPermission(Long roleId, Long applicationId) {
        List<PermissionDTO> vos = iRoleService.getRoleElementPermissionById(roleId, applicationId);
        return MultiResponse.ok(vos);
    }
}

