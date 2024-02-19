package com.ark.center.iam.domain.role.repository;

import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.role.Role;
import com.ark.component.ddd.domain.repository.BaseRepository;

import java.util.List;

public interface RoleRepository extends BaseRepository<Role, Long> {
    void insertUserRolesRelations(Long userId, List<Long> roleIds);

    void deleteUserRoleRelationsByUserId(Long userId);

    List<Long> selectRoleIdsByUserId(Long userId);

    List<Long> selectRoleIdsByUserGroupIds(List<Long> userGroupIds);

    long countByCode(String code);

    /**
     * 缓存角色权限
     */
    void saveRoleApiPermissionCache(Long roleId, List<Api> apis);

    boolean existsByCode(Long roleId, String code);
}
