package com.ark.center.iam.infra.role.gateway.impl;

import com.ark.center.iam.domain.role.vo.UserRoleVO;
import com.ark.center.iam.domain.role.gateway.RoleGateway;
import com.ark.center.iam.infra.role.gateway.db.IamRole;
import com.ark.center.iam.infra.role.gateway.db.IamRoleMapper;
import com.ark.center.iam.infra.role.gateway.db.UserRoleRel;
import com.ark.center.iam.infra.role.gateway.db.UserRoleRelMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class RoleGatewayImpl extends ServiceImpl<IamRoleMapper, IamRole> implements RoleGateway {

    private final UserRoleRelMapper userRoleRelMapper;

    @Override
    public void insertUserRolesRelations(Long userId, List<Long> roleIds) {
        userRoleRelMapper.batchInsert(userId, roleIds);
    }

    @Override
    public void deleteUserRoleRelations(Long userId) {
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
                .toList();
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
}
