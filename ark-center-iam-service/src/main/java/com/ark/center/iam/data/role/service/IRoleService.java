package com.ark.center.iam.data.role.service;

import com.ark.center.iam.client.role.command.*;
import com.ark.center.iam.client.role.query.RoleQry;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ark.center.iam.dao.entity.IamRole;
import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.client.role.dto.RoleBaseDTO;
import com.ark.center.iam.client.role.dto.RoleListDTO;

import java.util.List;

/**
 * <p>
 * 角色表 服务类
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
public interface IRoleService extends IService<IamRole> {

    Page<RoleListDTO> pageList(RoleQry dto);

    void saveRole(RoleCmd dto);

    void updateRoleById(RoleCmd dto);

    void updateStatus(RoleCmd dto);

    /**
     * 根据用户id查询下面的所有角色id
     */
    List<Long> getRoleIdsByUserId(Long userId);

    /**
     * 根据用户组id查询下面的所有角色id
     */
    List<Long> getRoleIdsByUserGroupIds(List<Long> userGroupIds);

    void updateRoleRoutePermissions(RoleRoutePermissionUpdateDTO dto);

    List<PermissionDTO> getRoleRoutePermissionById(Long roleId, Long applicationId);

    List<PermissionDTO> getRoleElementPermissionById(Long roleId, Long applicationId);

    void removeUserRoleRelByUserId(Long userId);

    List<RoleListDTO> listAllVos();

    List<String> getRoleNamesByUserId(Long userId);

    RoleBaseDTO getRoleVoById(String id);

    List<PermissionDTO> getRoleApiPermissionById(Long roleId, Long applicationId);

    void updateRoleApiPermissions(RoleApiPermissionUpdateDTO dto);

    void removeRoleById(Long id);

    List<String> getRoleNamesByUserGroupId(Long id);

    List<Long> getRoleIdsByUserGroupId(Long id);

    void updateRoleApiPermissions(RoleApplicationApiPermissionUpdateDTO dto);
}
