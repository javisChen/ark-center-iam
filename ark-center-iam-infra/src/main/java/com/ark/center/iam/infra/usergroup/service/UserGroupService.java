package com.ark.center.iam.infra.usergroup.service;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.client.usergroup.dto.UserGroupBaseDTO;
import com.ark.center.iam.client.usergroup.query.UserGroupQry;
import com.ark.center.iam.infra.usergroup.UserGroup;
import com.ark.center.iam.infra.usergroup.enums.UserGroupInheritType;
import com.ark.center.iam.infra.usergroup.vo.UserGroupVO;
import com.ark.center.iam.infra.usergroup.assembler.UserGroupAssembler;
import com.ark.center.iam.infra.usergroup.gateway.db.*;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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
public class UserGroupService extends ServiceImpl<UserGroupMapper, UserGroup> {

    private final UserGroupUserRelMapper userGroupUserRelMapper;
    private final UserGroupRoleRelMapper userGroupRoleRelMapper;
    private final UserGroupAssembler userGroupAssembler;

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

    public void deleteUserGroupAndUserRelationsByUserId(Long userId) {
        LambdaQueryWrapper<UserGroupUserRel> wrapper = new LambdaQueryWrapper<UserGroupUserRel>()
                .eq(UserGroupUserRel::getUserId, userId);
        userGroupUserRelMapper.delete(wrapper);
    }

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

    public List<UserGroupVO> selectUserGroupsByUserIds(List<Long> userIds) {
        return baseMapper.selectUserGroupsByUserIds(userIds);
    }

    public void deleteUserGroupAndRoleRelationsByUserGroupId(Long userGroupId) {
        LambdaUpdateWrapper<UserGroupRoleRel> qw = new LambdaUpdateWrapper<>();
        qw.eq(UserGroupRoleRel::getUserGroupId, userGroupId);
        userGroupRoleRelMapper.delete(qw);
    }

    public Page<UserGroup> selectPages(UserGroupQry dto) {
        LambdaQueryWrapper<UserGroup> queryWrapper = new LambdaQueryWrapper<UserGroup>()
                .like(StrUtil.isNotBlank(dto.getName()), UserGroup::getName, dto.getName())
                .eq(UserGroup::getPid, dto.getPid())
                .eq(UserGroup::getIsDeleted, DeletedEnums.NOT.getCode())
                .orderByAsc(UserGroup::getCreateTime);
        return page(new Page<>(dto.getCurrent(), dto.getSize()), queryWrapper);
    }

    public List<UserGroup> selectListWithoutRoot() {
        return this.list(new LambdaQueryWrapper<UserGroup>()
                .ne(UserGroup::getPid, 0));
    }

    public List<UserGroupBaseDTO> selectList() {
        LambdaQueryWrapper<UserGroup> queryWrapper = new LambdaQueryWrapper<UserGroup>()
                .orderByAsc(UserGroup::getCreateTime)
                .orderByAsc(UserGroup::getLevel);
        return list(queryWrapper).stream()
                .map(userGroupAssembler::toBaseDTO)
                .collect(Collectors.toList());
    }

    public UserGroup selectById(Long id) {
        return getById(id);
    }

    public void insert(UserGroup userGroup) {
        save(userGroup);
    }

    public void updateByUserGroupId(UserGroup userGroup) {
        updateById(userGroup);
    }

    public void insertUserGroupAndRolesRelations(Long userGroupId, List<Long> roleIds) {
        userGroupRoleRelMapper.insertBatch(userGroupId, roleIds);
    }

    public List<UserGroup> selectSubUserGroups(String levelPath) {
        return lambdaQuery()
                .likeRight(UserGroup::getLevelPath, levelPath)
                .list();
    }

    public void deleteByIds(List<Long> ids) {
        removeByIds(ids);
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
