package com.ark.center.iam.infra.role.repository;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.infra.relation.db.*;
import com.ark.center.iam.infra.role.repository.db.*;
import com.ark.center.iam.model.role.dto.RoleBaseDTO;
import com.ark.center.iam.model.role.query.RoleQuery;
import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.role.Role;
import com.ark.center.iam.domain.role.repository.RoleRepository;
import com.ark.center.iam.domain.role.vo.UserRoleVO;
import com.ark.center.iam.infra.role.converter.RoleDomainConverter;
import com.ark.center.iam.infra.role.repository.cache.RoleCacheKey;
import com.ark.component.cache.CacheService;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class RoleDBRepository extends BaseDBRepository<Role, Long> implements RoleRepository {

    private final UserRoleRelMapper userRoleRelMapper;
    private final UserRoleRelDAO userRoleRelDAO;
    private final UserGroupRoleRelDAO userGroupRoleRelDAO;
    private final RoleDAO roleDAO;
    private final RoleDomainConverter roleDomainConverter;
    private final CacheService cacheService;

    @Override
    public void insertUserRolesRelations(Long userId, List<Long> roleIds) {
        userRoleRelDAO.batchInsert(userId, roleIds);
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
    public List<UserRoleVO> selectRolesByUserIds(List<Long> userIds) {
        return baseMapper.selectRolesByUserIds(userIds);
    }

    @Override
    public IPage<RoleBaseDTO> selectPages(RoleQuery params) {
        return lambdaQuery()
                .like(StrUtil.isNotBlank(params.getName()), Role::getName, params.getName())
                .page(new Page<>(params.getCurrent(), params.getSize()))
                .convert(roleDomainConverter::toRoleBaseDTO);
    }

    @Override
    public List<RoleBaseDTO> selectList() {
        return this.list().stream().map(roleDomainConverter::toRoleBaseDTO).collect(Collectors.toList());
    }

    @Override
    public void insert(Role role) {
        save(role);
    }

    @Override
    public long countByName(String name) {
        return lambdaQuery()
                .eq(Role::getName, name)
                .count();
    }

    @Override
    public long countByCode(String code) {
        return lambdaQuery()
                .eq(Role::getCode, code)
                .count();
    }

    @Override
    public void updateByRoleId(Role role) {
        updateById(role);
    }

    @Override
    public RoleBaseDTO selectById(Long id) {
        Role role = getById(id);
        return roleDomainConverter.toRoleBaseDTO(role);
    }

    @Override
    public void logicDelete(Long id) {
        LambdaUpdateWrapper<Role> qw = new LambdaUpdateWrapper<>();
        qw.eq(Role::getId, id);
        qw.eq(Role::getIsDeleted, DeletedEnums.NOT.getCode());
        qw.set(Role::getIsDeleted, id);
        update(qw);
    }

    @Override
    public void deleteUserRoleRelationsByRoleId(Long roleId) {
        LambdaQueryWrapper<UserRoleRelDO> eq = new LambdaQueryWrapper<UserRoleRelDO>()
                .eq(UserRoleRelDO::getRoleId, roleId);
        userRoleRelMapper.delete(eq);
    }

    @Override
    public void updateStatusById(Long id, Integer status) {
        lambdaUpdate()
                .eq(Role::getStatus, id)
                .set(Role::getStatus, status)
                .update();
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
                .eq(UserGroupRoleRel::getRoleId, id)
                .remove();

    }
}
