package com.ark.center.iam.infra.relation.db;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserRoleRelDAO extends ServiceImpl<UserRoleRelMapper, UserRoleRelDO> {

    public void batchInsert(Long userId, List<Long> roleIds) {
        baseMapper.batchInsert(userId, roleIds);
    }

}
