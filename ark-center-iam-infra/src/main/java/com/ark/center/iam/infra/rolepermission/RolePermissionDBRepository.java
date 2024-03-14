package com.ark.center.iam.infra.rolepermission;

import com.ark.center.iam.domain.permission.vo.PermissionType;
import com.ark.center.iam.domain.rolepermission.RolePermission;
import com.ark.center.iam.domain.rolepermission.RolePermissionRepository;
import com.ark.center.iam.infra.relation.db.PermissionRoleRelDAO;
import com.ark.center.iam.infra.relation.db.bo.PermissionRoleRelBO;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import lombok.RequiredArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class RolePermissionDBRepository extends BaseDBRepository<RolePermission, Long> implements RolePermissionRepository {

    private final PermissionRoleRelDAO permissionRoleRelDAO;

    @Override
    public RolePermission byId(Long id) {
        RolePermission rolePermission = new RolePermission();
        rolePermission.setId(id);
        List<PermissionRoleRelBO> roleRelDOS = permissionRoleRelDAO.getBaseMapper().selectByRoleIdAndType(null, id, null);
        if (CollectionUtils.isEmpty(roleRelDOS)) {
            return rolePermission;
        }
        rolePermission.setMenuPermissionIds(roleRelDOS.stream()
                .filter(item -> item.getPermissionType().equals(PermissionType.MENU.getName()))
                .map(PermissionRoleRelBO::getPermissionId).collect(Collectors.toList()));

        rolePermission.setApiPermissionIds(roleRelDOS.stream()
                .filter(item -> item.getPermissionType().equals(PermissionType.SER_API.getName()))
                .map(PermissionRoleRelBO::getPermissionId).collect(Collectors.toList()));
        return rolePermission;
    }

    @Override
    public void save(RolePermission rolePermission) {
        Long roleId = rolePermission.getId();
        List<PermissionRoleRelBO> permissionRoleRelDOList = permissionRoleRelDAO.getBaseMapper().selectByRoleIdAndType(null, roleId, null);
        // 先把关联表id查出来然后排序，再根据id去删除，避免死锁
        if (CollectionUtils.isNotEmpty(permissionRoleRelDOList)) {
            List<Long> ids = permissionRoleRelDOList.stream().map(PermissionRoleRelBO::getId).sorted().collect(Collectors.toList());
            permissionRoleRelDAO.removeBatchByIds(ids);
        }
        List<Long> apiPermissionIds = rolePermission.getApiPermissionIds();
        List<Long> menuPermissionIds = rolePermission.getMenuPermissionIds();
        List<Long> allIds = new ArrayList<>(apiPermissionIds.size() + menuPermissionIds.size());
        allIds.addAll(apiPermissionIds);
        allIds.addAll(menuPermissionIds);
        permissionRoleRelDAO.getBaseMapper().batchInsert(roleId, allIds);
    }

    @Override
    public void delete(RolePermission rolePermission) {

    }
}
