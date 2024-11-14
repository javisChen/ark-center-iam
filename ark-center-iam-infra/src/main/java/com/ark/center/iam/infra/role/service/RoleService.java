package com.ark.center.iam.infra.role.service;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.client.role.dto.RoleBaseDTO;
import com.ark.center.iam.client.role.query.RoleQuery;
import com.ark.center.iam.infra.api.Api;
import com.ark.center.iam.infra.role.Role;

import com.ark.center.iam.infra.role.vo.UserRoleVO;
import com.ark.center.iam.infra.role.assembler.RoleAssembler;
import com.ark.center.iam.infra.role.gateway.cache.RoleCacheKey;
import com.ark.center.iam.infra.role.gateway.db.RoleMapper;
import com.ark.center.iam.infra.role.gateway.db.UserRoleRel;
import com.ark.center.iam.infra.role.gateway.db.UserRoleRelMapper;
import com.ark.component.cache.CacheService;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class RoleService extends ServiceImpl<RoleMapper, Role> {

    private final UserRoleRelMapper userRoleRelMapper;
    private final RoleAssembler roleAssembler;
    private final CacheService cacheService;

    public void insertUserRolesRelations(Long userId, List<Long> roleIds) {
        userRoleRelMapper.batchInsert(userId, roleIds);
    }

    public void deleteUserRoleRelationsByUserId(Long userId) {
        LambdaQueryWrapper<UserRoleRel> eq = new LambdaQueryWrapper<UserRoleRel>()
                .eq(UserRoleRel::getUserId, userId);
        userRoleRelMapper.delete(eq);
    }

    public List<Long> queryRoleIdsByUserId(Long userId) {
        LambdaQueryWrapper<UserRoleRel> eq = Wrappers.lambdaQuery(UserRoleRel.class)
                .select(UserRoleRel::getUserId, UserRoleRel::getRoleId)
                .eq(UserRoleRel::getUserId, userId);
        return userRoleRelMapper
                .selectList(eq)
                .stream()
                .map(UserRoleRel::getRoleId)
                .collect(Collectors.toList());
    }

    public List<Long> selectRoleIdsByUserGroupIds(List<Long> userGroupIds) {
        if (CollectionUtils.isEmpty(userGroupIds)) {
            return Collections.emptyList();
        }
        return userRoleRelMapper.selectRoleIdsByUserGroupIds(userGroupIds);
    }

    public List<UserRoleVO> selectRolesByUserIds(List<Long> userIds) {
        return baseMapper.selectRolesByUserIds(userIds);
    }

    public IPage<RoleBaseDTO> selectPages(RoleQuery params) {
        return lambdaQuery()
                .like(StrUtil.isNotBlank(params.getName()), Role::getName, params.getName())
                .page(new Page<>(params.getCurrent(), params.getSize()))
                .convert(roleAssembler::toRoleBaseDTO);
    }

    public List<RoleBaseDTO> selectList() {
        return this.list().stream().map(roleAssembler::toRoleBaseDTO).collect(Collectors.toList());
    }

    public void insert(Role role) {
        save(role);
    }

    public long countByCode(String code) {
        return lambdaQuery()
                .eq(Role::getCode, code)
                .count();
    }

    public RoleBaseDTO selectById(Long id) {
        Role role = getById(id);
        return roleAssembler.toRoleBaseDTO(role);
    }

    public void logicDelete(Long id) {
        LambdaUpdateWrapper<Role> qw = new LambdaUpdateWrapper<>();
        qw.eq(Role::getId, id);
        qw.eq(Role::getIsDeleted, DeletedEnums.NOT.getCode());
        qw.set(Role::getIsDeleted, id);
        update(qw);
    }

    public void deleteUserRoleRelationsByRoleId(Long roleId) {
        LambdaQueryWrapper<UserRoleRel> eq = new LambdaQueryWrapper<UserRoleRel>()
                .eq(UserRoleRel::getRoleId, roleId);
        userRoleRelMapper.delete(eq);
    }

    public void saveRoleApiPermissionCache(Long roleId, List<Api> apis) {
        String key = String.format(RoleCacheKey.ROLE_API_PERM_KEY, roleId);
        cacheService.del(key);

        if (CollectionUtil.isNotEmpty(apis)) {
            List<String> elements = apis.stream().map(item -> item.getUri() + ":" + item.getMethod()).toList();
            cacheService.sAdd(key, elements.toArray());
        }
    }
}
