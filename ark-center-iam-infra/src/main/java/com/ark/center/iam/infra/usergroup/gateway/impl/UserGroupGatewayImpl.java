package com.ark.center.iam.infra.usergroup.gateway.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.domain.usergroup.enums.UserGroupInheritType;
import com.ark.center.iam.domain.usergroup.gateway.UserGroupGateway;
import com.ark.center.iam.domain.usergroup.vo.UserGroupVO;
import com.ark.center.iam.infra.usergroup.UserGroup;
import com.ark.center.iam.infra.usergroup.gateway.db.*;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Repository
@RequiredArgsConstructor
public class UserGroupGatewayImpl extends ServiceImpl<UserGroupMapper, UserGroup> implements UserGroupGateway {

    private final UserGroupUserRelMapper userGroupUserRelMapper;
    private final UserGroupRoleRelMapper userGroupRoleRelMapper;

    @Override
    public void insertUserGroupAndUserRelations(Long userId, List<Long> userGroupIds) {
        List<UserGroupUserRel> list = userGroupIds.stream()
                .map(userGroupId -> {
                    UserGroupUserRel userRel = new UserGroupUserRel();
                    userRel.setUserGroupId(userGroupId);
                    userRel.setUserId(userId);
                    return userRel;
                }).toList();
        userGroupUserRelMapper.insertBatch(list);
    }

    @Override
    public void deleteUserGroupAndRoleRelationsByUserId(Long userId) {
        LambdaQueryWrapper<UserGroupUserRel> wrapper = new LambdaQueryWrapper<UserGroupUserRel>()
                .eq(UserGroupUserRel::getUserId, userId);
        userGroupUserRelMapper.delete(wrapper);
    }

    @Override
    public List<Long> selectUserGroupIdsByUserId(Long userId) {
        LambdaQueryWrapper<UserGroupUserRel> eq = Wrappers.lambdaQuery(UserGroupUserRel.class)
                .select(UserGroupUserRel::getUserId, UserGroupUserRel::getUserGroupId)
                .eq(UserGroupUserRel::getUserId, userId);
        return userGroupUserRelMapper
                .selectList(eq)
                .stream()
                .map(UserGroupUserRel::getUserGroupId)
                .toList();
    }

    @Override
    public List<Long> selectUserGroupIdsByUserId(Long userId, boolean includeParent) {
        List<UserGroup> userGroups = baseMapper.selectUserGroupsByUserId(userId);
        if (CollectionUtil.isEmpty(userGroups)) {
            return Collections.emptyList();
        }
        if (!includeParent) {
            return userGroups.stream().map(BaseEntity::getId).toList();
        }
        return Lists.newArrayList(collectParentUserGroupIds(userGroups));
    }

    @Override
    public List<UserGroupVO> selectUserGroupsByUserIds(List<Long> userIds) {
        return baseMapper.selectUserGroupsByUserIds(userIds);
    }

    @Override
    public void deleteUserGroupAndRoleRelationsByRoleId(Long roleId) {
        LambdaUpdateWrapper<UserGroupRoleRel> qw = new LambdaUpdateWrapper<>();
        qw.eq(UserGroupRoleRel::getRoleId, roleId);
        userGroupRoleRelMapper.delete(qw);
    }

    /**
     * 收集继承的父级用户组
     */
    public Set<Long> collectParentUserGroupIds(List<UserGroup> userGroups) {
        return userGroups.stream()
                .filter(item -> !item.getPid().equals(0L))
                .flatMap(item -> {
                    if (Objects.equals(item.getInheritType(), UserGroupInheritType.INHERIT_PARENT.getValue())) {
                        return Stream.of(item.getId(), item.getPid());
                    } else if (Objects.equals(item.getInheritType(), UserGroupInheritType.INHERIT_ALL.getValue())) {
                        return Stream.of(item.getLevelPath().split("\\."))
                                .map(Long::valueOf)
                                .distinct();
                    } else {
                        return Stream.empty();
                    }
                })
                .collect(Collectors.toSet());

    }
}
