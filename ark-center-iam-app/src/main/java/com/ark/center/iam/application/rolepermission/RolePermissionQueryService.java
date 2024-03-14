package com.ark.center.iam.application.rolepermission;

import com.ark.center.iam.domain.permission.vo.PermissionType;
import com.ark.center.iam.infra.permission.repository.db.PermissionDAO;
import com.ark.center.iam.model.permission.vo.PermissionDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RolePermissionQueryService {

    private final PermissionDAO permissionDAO;

    public List<PermissionDTO> queryRoleApiPermissions(Long roleId, Long applicationId) {
        return permissionDAO.selectRolePermissions(applicationId, roleId, PermissionType.SER_API.getName());
    }

    public List<PermissionDTO> queryRoleElementPermissions(Long roleId, Long applicationId) {
        return permissionDAO.selectRolePermissions(applicationId, roleId, PermissionType.MENU_ELEMENT.getName());
    }

    public List<PermissionDTO> queryRoleMenuPermissions(Long roleId, Long applicationId) {
        return permissionDAO.selectRolePermissions(applicationId, roleId, PermissionType.MENU.getName());
    }

}
