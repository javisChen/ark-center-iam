package com.ark.center.iam.infra.usergroup.repository.db;

import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.model.usergroup.query.UserGroupQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class UserGroupDAO extends ServiceImpl<UserGroupMapper, UserGroupDO> {

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
}
