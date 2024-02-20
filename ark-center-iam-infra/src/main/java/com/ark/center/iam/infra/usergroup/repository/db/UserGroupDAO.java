package com.ark.center.iam.infra.usergroup.repository.db;

import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.infra.relation.db.UserGroupRoleRelDAO;
import com.ark.center.iam.infra.relation.db.UserGroupRoleRelDO;
import com.ark.center.iam.infra.relation.db.UserGroupUserRelDAO;
import com.ark.center.iam.infra.relation.db.UserGroupUserRelDO;
import com.ark.center.iam.model.usergroup.query.UserGroupQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserGroupDAO extends ServiceImpl<UserGroupMapper, UserGroupDO> {

    private final UserGroupRoleRelDAO userGroupRoleRelDAO;
    private final UserGroupUserRelDAO userGroupUserRelDAO;

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
                .stream().toList();

    }

    public List<Long> selectUserGroupIdsByUserId(Long userId) {
        return userGroupUserRelDAO
                .lambdaQuery()
                .select(UserGroupUserRelDO::getUserId, UserGroupUserRelDO::getUserGroupId)
                .eq(UserGroupUserRelDO::getUserId, userId)
                .list()
                .stream()
                .map(UserGroupUserRelDO::getUserGroupId)
                .toList();
    }

    public List<Long> selectRoleIdsById(Long id) {
        return userGroupRoleRelDAO
                .lambdaQuery()
                .select(UserGroupRoleRelDO::getRoleId, UserGroupRoleRelDO::getUserGroupId)
                .eq(UserGroupRoleRelDO::getUserGroupId, id)
                .list()
                .stream()
                .map(UserGroupRoleRelDO::getRoleId)
                .toList();
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
