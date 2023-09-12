package com.ark.center.iam.application.role;


import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.application.role.executor.RoleCreateCmdExe;
import com.ark.center.iam.application.role.executor.RoleDeleteCmdExe;
import com.ark.center.iam.application.role.executor.RoleUpdateCmdExe;
import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.client.role.command.RoleApiPermissionGrantCmd;
import com.ark.center.iam.client.role.command.RoleRoutePermissionGrantCmd;
import com.ark.center.iam.client.role.dto.RoleBaseDTO;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.application.role.event.RolePermissionChangedEvent;
import com.ark.center.iam.domain.permission.gateway.PermissionGateway;
import com.ark.center.iam.domain.role.gateway.RoleGateway;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationEventPublisher;
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

    private final ApplicationEventPublisher eventPublisher;
    private final ApplicationContext applicationContext;

    private final PermissionGateway permissionGateway;


    @Transactional(rollbackFor = Throwable.class)
    public void grantRoutePermissions(RoleRoutePermissionGrantCmd cmd) {
        Long roleId = cmd.getRoleId();
        Long applicationId = cmd.getApplicationId();
        List<Long> toRemoveIds = CollectionUtil.newArrayList(cmd.getToRemoveRoutePermissionIds());
        toRemoveIds.addAll(cmd.getToRemoveElementPermissionIds());
        permissionGateway.deleteRolePermissionByIds(applicationId, roleId, toRemoveIds);


        List<Long> toAddIds = CollectionUtil.newArrayList(cmd.getToAddRoutePermissionIds());
        toAddIds.addAll(cmd.getToAddElementPermissionIds());
        permissionGateway.insertBatchRolePermissionRelations(roleId, toAddIds);
    }

    public List<PermissionDTO> queryRoleRoutesPermissions(Long roleId, Long applicationId) {
        return permissionGateway.selectRolePermissions(applicationId, roleId, PermissionType.FRONT_ROUTE.getName());
    }

    @Transactional(rollbackFor = Throwable.class)
    public void grantApis(RoleApiPermissionGrantCmd dto) {
        Long roleId = dto.getRoleId();
        Long applicationId = dto.getApplicationId();

        List<Long> toRemoveApiPermissionIds = dto.getToRemoveApiPermissionIds();
        permissionGateway.deleteRolePermissionByIds(applicationId, roleId, toRemoveApiPermissionIds);

        List<Long> toAddApiPermissionIds = dto.getToAddApiPermissionIds();
        permissionGateway.insertBatchRolePermissionRelations(roleId, toAddApiPermissionIds);

        RoleBaseDTO roleBaseDTO = roleGateway.selectById(roleId);
        String roleName = roleBaseDTO.getName();
        eventPublisher.publishEvent(new RolePermissionChangedEvent(this, roleId, roleName, PermissionType.SER_API));

    }

    public List<PermissionDTO> queryRoleApiPermissions(Long roleId, Long applicationId) {
        return permissionGateway.selectRolePermissions(applicationId, roleId, PermissionType.SER_API.getName());
    }

    public List<PermissionDTO> queryRoleElementPermissions(Long roleId, Long applicationId) {
        return permissionGateway.selectRolePermissions(applicationId, roleId, PermissionType.PAGE_ELEMENT.getName());
    }
}
