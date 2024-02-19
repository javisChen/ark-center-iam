package com.ark.center.iam.infra.relation.db;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserGroupUserRelDAO extends ServiceImpl<UserGroupUserRelMapper, UserGroupUserRelDO> {


    public void batchSave(Long userId, List<Long> userGroupIds) {
        baseMapper.insertBatch(
                userGroupIds.stream().map(userGroupId -> {
                    UserGroupUserRelDO relDO = new UserGroupUserRelDO();
                    relDO.setUserGroupId(userGroupId);
                    relDO.setUserId(userId);
                    return relDO;
                }).toList()
        );

    }
}
