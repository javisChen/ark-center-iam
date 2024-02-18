package com.ark.center.iam.domain.role.repository;

import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.role.Role;
import com.ark.center.iam.domain.role.vo.UserRoleVO;
import com.ark.center.iam.model.role.dto.RoleBaseDTO;
import com.ark.center.iam.model.role.query.RoleQuery;
import com.ark.component.ddd.domain.repository.BaseRepository;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.List;

public interface RoleRepository extends BaseRepository<Role, Long> {
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

    boolean existsByCode(Long roleId, String code);
}
