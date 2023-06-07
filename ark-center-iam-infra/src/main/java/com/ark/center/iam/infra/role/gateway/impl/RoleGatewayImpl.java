package com.ark.center.iam.infra.role.gateway.impl;

import com.ark.center.iam.domain.role.gateway.RoleGateway;
import com.ark.center.iam.infra.role.gateway.db.IamRole;
import com.ark.center.iam.infra.role.gateway.db.IamRoleMapper;
import com.ark.center.iam.infra.role.gateway.db.IamUserRoleRel;
import com.ark.center.iam.infra.role.gateway.db.IamUserRoleRelMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class RoleGatewayImpl extends ServiceImpl<IamRoleMapper, IamRole> implements RoleGateway {

    private final IamUserRoleRelMapper iamUserRoleRelMapper;
    @Override
    public void insertUserRolesRelations(Long userId, List<Long> roleIds) {
        iamUserRoleRelMapper.batchInsert(userId, roleIds);
    }
}
