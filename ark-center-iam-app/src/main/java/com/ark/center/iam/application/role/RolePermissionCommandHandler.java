package com.ark.center.iam.application.role;


import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.client.role.command.RoleApiPermissionGrantCommand;
import com.ark.center.iam.client.role.command.RoleMenuPermissionGrantCommand;
import com.ark.center.iam.infra.permission.enums.PermissionType;
import com.ark.center.iam.application.role.event.RolePermissionChangedEvent;
import com.ark.center.iam.infra.permission.gateway.impl.PermissionService;

import com.ark.center.iam.infra.role.Role;
import com.ark.center.iam.infra.role.service.RoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@RequiredArgsConstructor
public class RolePermissionCommandHandler {

    private final RoleService roleService;
    private final ApplicationEventPublisher eventPublisher;
    private final PermissionService permissionService;


    @Transactional(rollbackFor = Throwable.class)
    public void grantRoutePermissions(RoleMenuPermissionGrantCommand command) {
        Long roleId = command.getRoleId();
        Long applicationId = command.getApplicationId();
        List<Long> toRemoveIds = CollectionUtil.newArrayList(command.getToRemoveMenuPermissionIds());
        toRemoveIds.addAll(command.getToRemoveElementPermissionIds());
        permissionService.deleteRolePermissionByIds(applicationId, roleId, toRemoveIds);

        List<Long> toAddIds = CollectionUtil.newArrayList(command.getToAddMenuPermissionIds());
        toAddIds.addAll(command.getToAddElementPermissionIds());
        permissionService.insertBatchRolePermissionRelations(roleId, toAddIds);

        Role role = roleService.getById(roleId);
        String roleName = role.getName();
        eventPublisher.publishEvent(new RolePermissionChangedEvent(this, roleId, roleName, PermissionType.FRONT_ROUTE));
    }

    @Transactional(rollbackFor = Throwable.class)
    public void grantApis(RoleApiPermissionGrantCommand dto) {
        Long roleId = dto.getRoleId();
        Long applicationId = dto.getApplicationId();

        List<Long> toRemoveApiPermissionIds = dto.getToRemoveApiPermissionIds();
        permissionService.deleteRolePermissionByIds(applicationId, roleId, toRemoveApiPermissionIds);

        List<Long> toAddApiPermissionIds = dto.getToAddApiPermissionIds();
        permissionService.insertBatchRolePermissionRelations(roleId, toAddApiPermissionIds);

        Role role = roleService.getById(roleId);
        String roleName = role.getName();
        eventPublisher.publishEvent(new RolePermissionChangedEvent(this, roleId, roleName, PermissionType.SER_API));

    }
}
