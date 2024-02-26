package com.ark.center.iam.infra.relation.db;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserRoleRelDAO extends ServiceImpl<UserRoleRelMapper, UserRoleRelDO> {

    public void batchSave(Long userId, List<Long> roleIds) {
        baseMapper.batchInsert(userId, roleIds);
    }

    public List<Long> selectIdsByUserId(Long userId) {
        return lambdaQuery()
                .select(UserRoleRelDO::getRoleId)
                .eq(UserRoleRelDO::getUserId, userId)
                .list()
                .stream()
                .map(UserRoleRelDO::getRoleId)
                .collect(Collectors.toList());
    }
}
