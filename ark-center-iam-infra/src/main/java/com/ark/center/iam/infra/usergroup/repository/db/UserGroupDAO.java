package com.ark.center.iam.infra.usergroup.repository.db;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.domain.usergroup.vo.InheritType;
import com.ark.center.iam.infra.relation.db.UserGroupRoleRelDAO;
import com.ark.center.iam.infra.relation.db.UserGroupRoleRelDO;
import com.ark.center.iam.model.usergroup.query.UserGroupQuery;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserGroupDAO extends ServiceImpl<UserGroupMapper, UserGroupDO> {

    private final UserGroupRoleRelDAO userGroupRoleRelDAO;

    public Page<UserGroupDO> selectPages(UserGroupQuery query) {
        return lambdaQuery()
                .like(StrUtil.isNotBlank(query.getName()), UserGroupDO::getName, query.getName())
                .eq(UserGroupDO::getPid, query.getPid())
                .orderByAsc(UserGroupDO::getCreateTime)
                .page(new Page<>(query.getCurrent(), query.getSize()));
    }

    public List<UserGroupDO> selectChildGroups() {
        return lambdaQuery()
                .gt(UserGroupDO::getPid, 0)
                .orderByAsc(UserGroupDO::getCreateTime)
                .list();
    }

    public List<UserGroupDO> selectList() {
        return lambdaQuery()
                .orderByAsc(UserGroupDO::getCreateTime)
                .orderByAsc(UserGroupDO::getLevel).list()
                .stream().collect(Collectors.toList());

    }

    public List<Long> selectUserGroupIdsByUserId(Long userId, boolean includeParent) {
        List<UserGroupDO> userGroups = baseMapper.selectByUserId(userId);
        if (CollectionUtil.isEmpty(userGroups)) {
            return Collections.emptyList();
        }
        if (!includeParent) {
            return userGroups.stream().map(BaseEntity::getId).collect(Collectors.toList());
        }
        return Lists.newArrayList(collectParentUserGroupIds(userGroups));
    }

    /**
     * 收集继承的父级用户组
     */
    public Set<Long> collectParentUserGroupIds(List<UserGroupDO> userGroups) {
        return userGroups.stream()
                .filter(item -> !item.getPid().equals(0L))
                .flatMap(item -> {
                    if (Objects.equals(item.getInheritType(), InheritType.INHERIT_PARENT.getValue())) {
                        return Stream.of(item.getId(), item.getPid());
                    } else if (Objects.equals(item.getInheritType(), InheritType.INHERIT_ALL.getValue())) {
                        return Stream.of(item.getLevelPath().split("\\."))
                                .map(Long::valueOf)
                                .distinct();
                    } else {
                        return Stream.empty();
                    }
                })
                .collect(Collectors.toSet());

    }

    public List<Long> selectRoleIdsById(Long id) {
        return userGroupRoleRelDAO
                .lambdaQuery()
                .select(UserGroupRoleRelDO::getRoleId, UserGroupRoleRelDO::getUserGroupId)
                .eq(UserGroupRoleRelDO::getUserGroupId, id)
                .list()
                .stream()
                .map(UserGroupRoleRelDO::getRoleId)
                .collect(Collectors.toList());
    }

    public void deleteRoleRelations(Long userGroupId) {
        userGroupRoleRelDAO
                .lambdaUpdate()
                .eq(UserGroupRoleRelDO::getUserGroupId, userGroupId)
                .remove();
    }

    public void saveRoleRelations(Long groupId, List<Long> roleIds) {
        userGroupRoleRelDAO.getBaseMapper().insertBatch(groupId, roleIds);
    }
}
