package com.ark.center.iam.infra.role.repository;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.infra.relation.db.*;
import com.ark.center.iam.infra.role.repository.db.*;
import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.role.Role;
import com.ark.center.iam.domain.role.repository.RoleRepository;
import com.ark.center.iam.infra.role.converter.RoleDomainConverter;
import com.ark.center.iam.infra.role.repository.cache.RoleCacheKey;
import com.ark.component.cache.CacheService;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class RoleDBRepository extends BaseDBRepository<Role, Long> implements RoleRepository {

    private final UserRoleRelDAO userRoleRelDAO;
    private final UserGroupRoleRelDAO userGroupRoleRelDAO;
    private final RoleDAO roleDAO;
    private final RoleDomainConverter roleDomainConverter;
    private final CacheService cacheService;

    @Override
    public void insertUserRolesRelations(Long userId, List<Long> roleIds) {
        userRoleRelDAO.batchSave(userId, roleIds);
    }

    @Override
    public void deleteUserRoleRelationsByUserId(Long userId) {
        userRoleRelDAO.lambdaUpdate()
                .eq(UserRoleRelDO::getUserId, userId)
                .remove();
    }

    @Override
    public List<Long> selectRoleIdsByUserId(Long userId) {
        return userRoleRelDAO.lambdaQuery()
                .select(UserRoleRelDO::getUserId, UserRoleRelDO::getRoleId)
                .eq(UserRoleRelDO::getUserId, userId)
                .list()
                .stream()
                .map(UserRoleRelDO::getRoleId)
                .toList();
    }

    @Override
    public List<Long> selectRoleIdsByUserGroupIds(List<Long> userGroupIds) {
        if (CollectionUtils.isEmpty(userGroupIds)) {
            return Collections.emptyList();
        }
        return userRoleRelDAO.getBaseMapper().selectRoleIdsByUserGroupIds(userGroupIds);
    }

    @Override
    public long countByCode(String code) {
        return roleDAO.lambdaQuery()
                .eq(RoleDO::getCode, code)
                .count();
    }

    @Override
    public void saveRoleApiPermissionCache(Long roleId, List<Api> apis) {
        String key = String.format(RoleCacheKey.ROLE_API_PERM_KEY, roleId);
        cacheService.del(key);

        if (CollectionUtil.isNotEmpty(apis)) {
            List<String> elements = apis.stream().map(item -> item.getUri() + ":" + item.getMethod()).toList();
            cacheService.sAdd(key, elements.toArray());
        }
    }

    @Override
    public boolean existsByCode(Long roleId, String code) {
        return roleDAO.lambdaQuery()
                .ne(roleId != null, RoleDO::getCode, code)
                .eq(RoleDO::getCode, code)
                .exists();
    }

    @Override
    public void save(Role role) {
        RoleDO roleDO = roleDomainConverter.fromDomain(role);
        roleDAO.saveOrUpdate(roleDO);
    }

    @Override
    public void delete(Role role) {
        RoleDO roleDO = roleDomainConverter.fromDomain(role);
        Long id = roleDO.getId();
        roleDAO.removeById(id);

        userRoleRelDAO.lambdaUpdate()
                .eq(UserRoleRelDO::getRoleId, id)
                .remove();

        userGroupRoleRelDAO.lambdaUpdate()
                .eq(UserGroupRoleRelDO::getRoleId, id)
                .remove();

    }

    @Override
    public Role byId(Long id) {
        RoleDO roleDO = roleDAO.getById(id);
        return roleDomainConverter.toDomain(roleDO);
    }

    @Override
    public List<Role> byIds(List<Long> longs) {
        return super.byIds(longs);
    }
}
