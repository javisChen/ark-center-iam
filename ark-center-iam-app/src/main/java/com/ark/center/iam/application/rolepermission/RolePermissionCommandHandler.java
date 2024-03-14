package com.ark.center.iam.application.rolepermission;

import com.ark.center.iam.application.role.event.RolePermissionChangedEvent;
import com.ark.center.iam.domain.permission.vo.PermissionType;
import com.ark.center.iam.domain.rolepermission.RolePermission;
import com.ark.center.iam.domain.rolepermission.RolePermissionRepository;
import com.ark.center.iam.model.role.command.RolePermissionGrantCmd;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@RequiredArgsConstructor
public class RolePermissionCommandHandler {

    private final ApplicationEventPublisher eventPublisher;

    private final RolePermissionRepository rolePermissionRepository;


    @Transactional(rollbackFor = Throwable.class)
    public void grantMenuPermission(RolePermissionGrantCmd cmd) {
        Long roleId = cmd.getRoleId();

        RolePermission rolePermission = rolePermissionRepository.byId(cmd.getRoleId());
        rolePermission.removeMenuPermissions(cmd.getToRemoveRoutePermissionIds());
        rolePermission.addMenuPermissions(cmd.getToAddRoutePermissionIds());

        rolePermissionRepository.saveAndPublishEvents(rolePermission);

        eventPublisher.publishEvent(new RolePermissionChangedEvent(this, roleId, PermissionType.MENU));
    }

    @Transactional(rollbackFor = Throwable.class)
    public void grantApiPermission(RolePermissionGrantCmd cmd) {
        Long applicationId = cmd.getApplicationId();
        Long roleId = cmd.getRoleId();

        RolePermission rolePermission = rolePermissionRepository.byId(cmd.getRoleId());
        rolePermission.removeApiPermissionIds(cmd.getToRemoveApiPermissionIds());
        rolePermission.addApiPermissionIds(cmd.getToAddApiPermissionIds());

        rolePermissionRepository.saveAndPublishEvents(rolePermission);

        eventPublisher.publishEvent(new RolePermissionChangedEvent(this, roleId, PermissionType.SER_API));

    }
}
