package com.ark.center.iam.application.role;


import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.application.role.executor.RoleCreateCmdExe;
import com.ark.center.iam.application.role.executor.RoleDeleteCmdExe;
import com.ark.center.iam.application.role.executor.RoleUpdateCmdExe;
import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.client.role.command.RoleApiPermissionUpdateDTO;
import com.ark.center.iam.client.role.command.RoleRoutePermissionGrantCmd;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.gateway.PermissionGateway;
import com.ark.center.iam.domain.role.gateway.RoleGateway;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@RequiredArgsConstructor
public class RolePermissionAppService {

    private final RoleCreateCmdExe roleCreateCmdExe;
    private final RoleUpdateCmdExe roleUpdateCmdExe;
    private final RoleDeleteCmdExe roleDeleteCmdExe;
    private final RoleGateway roleGateway;

    private final PermissionGateway permissionGateway;


    @Transactional(rollbackFor = Throwable.class)
    public void grantRoutes(RoleRoutePermissionGrantCmd cmd) {
        Long roleId = cmd.getRoleId();
        List<Long> toRemoveIds = CollectionUtil.newArrayList(cmd.getToRemoveRoutePermissionIds());
        toRemoveIds.addAll(cmd.getToRemoveElementPermissionIds());
        permissionGateway.deleteRolePermission(roleId, toRemoveIds);

        List<Long> toAddIds = CollectionUtil.newArrayList(cmd.getToAddRoutePermissionIds());
        toAddIds.addAll(cmd.getToAddElementPermissionIds());
        permissionGateway.insertBatchRolePermissionRelations(roleId, toAddIds);
    }

    public List<PermissionDTO> queryRoleRoutesPermissions(Long roleId, Long applicationId) {
        return permissionGateway.selectRolePermissions(applicationId, roleId, PermissionType.FRONT_ROUTE.getType());
    }

    public void grantApis(RoleApiPermissionUpdateDTO dto) {
        Long roleId = dto.getRoleId();
        permissionGateway.deleteRolePermission(roleId, dto.getToRemoveApiPermissionIds());
        permissionGateway.insertBatchRolePermissionRelations(roleId, dto.getToAddApiPermissionIds());
    }

    public List<PermissionDTO> queryRoleApiPermissions(Long roleId, Long applicationId) {
        return permissionGateway.selectRolePermissions(applicationId, roleId, PermissionType.SER_API.getType());
    }

    public List<PermissionDTO> queryRoleElementPermissions(Long roleId, Long applicationId) {
        return permissionGateway.selectRolePermissions(applicationId, roleId, PermissionType.PAGE_ELEMENT.getType());
    }
}
