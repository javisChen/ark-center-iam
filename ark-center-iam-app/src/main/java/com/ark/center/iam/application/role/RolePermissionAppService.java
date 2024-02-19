package com.ark.center.iam.application.role;


import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.application.role.event.RolePermissionChangedEvent;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.gateway.PermissionRepository;
import com.ark.center.iam.infra.role.repository.db.RoleDAO;
import com.ark.center.iam.infra.role.repository.db.RoleDO;
import com.ark.center.iam.model.permission.vo.PermissionDTO;
import com.ark.center.iam.model.role.command.RoleApiPermissionGrantCmd;
import com.ark.center.iam.model.role.command.RoleRoutePermissionGrantCmd;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@RequiredArgsConstructor
public class RolePermissionAppService {

    private final RoleDAO roleDAO;

    private final ApplicationEventPublisher eventPublisher;

    private final PermissionRepository permissionRepository;


    @Transactional(rollbackFor = Throwable.class)
    public void grantRoutePermissions(RoleRoutePermissionGrantCmd cmd) {
        Long roleId = cmd.getRoleId();
        Long applicationId = cmd.getApplicationId();
        List<Long> toRemoveIds = CollectionUtil.newArrayList(cmd.getToRemoveRoutePermissionIds());
        toRemoveIds.addAll(cmd.getToRemoveElementPermissionIds());
        permissionRepository.deleteRolePermissionByIds(applicationId, roleId, toRemoveIds);


        List<Long> toAddIds = CollectionUtil.newArrayList(cmd.getToAddRoutePermissionIds());
        toAddIds.addAll(cmd.getToAddElementPermissionIds());
        permissionRepository.insertBatchRolePermissionRelations(roleId, toAddIds);

        RoleDO roleBaseDTO = roleDAO.getById(roleId);
        String roleName = roleBaseDTO.getName();
        eventPublisher.publishEvent(new RolePermissionChangedEvent(this, roleId, roleName, PermissionType.MENU));
    }

    public List<PermissionDTO> queryRoleRoutesPermissions(Long roleId, Long applicationId) {
        return permissionRepository.selectRolePermissions(applicationId, roleId, PermissionType.MENU.getName());
    }

    @Transactional(rollbackFor = Throwable.class)
    public void grantApis(RoleApiPermissionGrantCmd dto) {
        Long roleId = dto.getRoleId();
        Long applicationId = dto.getApplicationId();

        List<Long> toRemoveApiPermissionIds = dto.getToRemoveApiPermissionIds();
        permissionRepository.deleteRolePermissionByIds(applicationId, roleId, toRemoveApiPermissionIds);

        List<Long> toAddApiPermissionIds = dto.getToAddApiPermissionIds();
        permissionRepository.insertBatchRolePermissionRelations(roleId, toAddApiPermissionIds);

        RoleDO roleDO = roleDAO.getById(roleId);
        String roleName = roleDO.getName();
        eventPublisher.publishEvent(new RolePermissionChangedEvent(this, roleId, roleName, PermissionType.SER_API));

    }

    public List<PermissionDTO> queryRoleApiPermissions(Long roleId, Long applicationId) {
        return permissionRepository.selectRolePermissions(applicationId, roleId, PermissionType.SER_API.getName());
    }

    public List<PermissionDTO> queryRoleElementPermissions(Long roleId, Long applicationId) {
        return permissionRepository.selectRolePermissions(applicationId, roleId, PermissionType.MENU_ELEMENT.getName());
    }
}
