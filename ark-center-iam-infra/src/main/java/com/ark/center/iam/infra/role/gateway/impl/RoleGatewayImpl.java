package com.ark.center.iam.infra.role.gateway.impl;

import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.client.role.dto.RoleBaseDTO;
import com.ark.center.iam.client.role.query.RoleQry;
import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.role.Role;
import com.ark.center.iam.domain.role.gateway.RoleGateway;
import com.ark.center.iam.domain.role.vo.UserRoleVO;
import com.ark.center.iam.infra.role.assembler.RoleAssembler;
import com.ark.center.iam.infra.role.gateway.cache.RoleCache;
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
public class RoleGatewayImpl extends ServiceImpl<RoleMapper, Role> implements RoleGateway {

    private final UserRoleRelMapper userRoleRelMapper;
    private final RoleAssembler roleAssembler;
    private final CacheService cacheService;

    @Override
    public void insertUserRolesRelations(Long userId, List<Long> roleIds) {
        userRoleRelMapper.batchInsert(userId, roleIds);
    }

    @Override
    public void deleteUserRoleRelationsByUserId(Long userId) {
        LambdaQueryWrapper<UserRoleRel> eq = new LambdaQueryWrapper<UserRoleRel>()
                .eq(UserRoleRel::getUserId, userId);
        userRoleRelMapper.delete(eq);
    }

    @Override
    public List<Long> selectRoleIdsByUserId(Long userId) {
        LambdaQueryWrapper<UserRoleRel> eq = Wrappers.lambdaQuery(UserRoleRel.class)
                .select(UserRoleRel::getUserId, UserRoleRel::getRoleId)
                .eq(UserRoleRel::getUserId, userId);
        return userRoleRelMapper
                .selectList(eq)
                .stream()
                .map(UserRoleRel::getRoleId)
                .collect(Collectors.toList());
    }

    @Override
    public List<Long> selectRoleIdsByUserGroupIds(List<Long> userGroupIds) {
        if (CollectionUtils.isEmpty(userGroupIds)) {
            return Collections.emptyList();
        }
        return userRoleRelMapper.selectRoleIdsByUserGroupIds(userGroupIds);
    }

    @Override
    public List<UserRoleVO> selectRolesByUserIds(List<Long> userIds) {
        return baseMapper.selectRolesByUserIds(userIds);
    }

    @Override
    public IPage<RoleBaseDTO> selectPages(RoleQry params) {
        return lambdaQuery()
                .like(StrUtil.isNotBlank(params.getName()), Role::getName, params.getName())
                .page(new Page<>(params.getCurrent(), params.getSize()))
                .convert(roleAssembler::toRoleBaseDTO);
    }

    @Override
    public List<RoleBaseDTO> selectList() {
        return this.list().stream().map(roleAssembler::toRoleBaseDTO).collect(Collectors.toList());
    }

    @Override
    public void insert(Role role) {

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
        return roleAssembler.toRoleBaseDTO(role);
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
        LambdaQueryWrapper<UserRoleRel> eq = new LambdaQueryWrapper<UserRoleRel>()
                .eq(UserRoleRel::getRoleId, roleId);
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
        String key = String.format(RoleCache.ROLE_API_PERM_KEY, roleId);
        cacheService.remove(key);

        List<String> elements = apis.stream().map(item -> item.getUri() + ":" + item.getMethod()).toList();
        cacheService.setAdd(key, elements.toArray());
    }
}
