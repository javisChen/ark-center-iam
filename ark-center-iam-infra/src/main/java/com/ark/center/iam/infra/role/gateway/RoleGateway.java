package com.ark.center.iam.infra.role.gateway;

import com.ark.center.iam.client.role.dto.RoleBaseDTO;
import com.ark.center.iam.client.role.query.RoleQuery;
import com.ark.center.iam.infra.api.Api;
import com.ark.center.iam.infra.role.Role;
import com.ark.center.iam.infra.role.vo.UserRoleVO;
import com.ark.component.orm.mybatis.base.BaseGateway;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.List;

public interface RoleGateway extends BaseGateway<Role> {
    void insertUserRolesRelations(Long userId, List<Long> roleIds);

    void deleteUserRoleRelationsByUserId(Long userId);

    List<Long> selectRoleIdsByUserId(Long userId);

    List<Long> selectRoleIdsByUserGroupIds(List<Long> userGroupIds);

    List<UserRoleVO> selectRolesByUserIds(List<Long> userIds);

    IPage<RoleBaseDTO> selectPages(RoleQuery dto);

    List<RoleBaseDTO> selectList();

    void insert(Role role);

    long countByName(String name);

    long countByCode(String code);

    void updateByRoleId(Role role);

    RoleBaseDTO selectById(Long id);

    void logicDelete(Long id);

    void deleteUserRoleRelationsByRoleId(Long roleId);

    void updateStatusById(Long id, Integer status);

    /**
     * 缓存角色权限
     */
    void saveRoleApiPermissionCache(Long roleId, List<Api> apis);

}
