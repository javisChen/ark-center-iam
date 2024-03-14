package com.ark.center.iam.infra.relation.db;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Repository
public class UserGroupUserRelDAO extends ServiceImpl<UserGroupUserRelMapper, UserGroupUserRelDO> {


    public void batchSave(Long userId, List<Long> userGroupIds) {
        baseMapper.insertBatch(
                userGroupIds.stream().map(userGroupId -> {
                    UserGroupUserRelDO relDO = new UserGroupUserRelDO();
                    relDO.setUserGroupId(userGroupId);
                    relDO.setUserId(userId);
                    return relDO;
                }).collect(Collectors.toList())
        );

    }

    public List<Long> selectIdsByUserId(Long userId) {
        return lambdaQuery()
                .select(UserGroupUserRelDO::getUserGroupId)
                .eq(UserGroupUserRelDO::getUserId, userId)
                .list()
                .stream()
                .map(UserGroupUserRelDO::getUserGroupId)
                .collect(Collectors.toList());
    }
}
