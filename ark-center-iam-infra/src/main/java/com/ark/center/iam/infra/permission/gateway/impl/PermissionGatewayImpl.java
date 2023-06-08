package com.ark.center.iam.infra.permission.gateway.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.domain.permission.Permission;
import com.ark.center.iam.domain.permission.enums.PermissionStatusEnums;
import com.ark.center.iam.domain.permission.gateway.PermissionGateway;
import com.ark.center.iam.infra.permission.gateway.db.PermissionMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.List;

@Repository
public class PermissionGatewayImpl extends ServiceImpl<PermissionMapper, Permission> implements PermissionGateway {
    @Override
    public List<Permission> selectByType(String permissionType) {
        return lambdaQuery()
                .eq(Permission::getType, permissionType)
                .eq(Permission::getStatus, PermissionStatusEnums.ENABLED.getValue())
                .list();
    }

    @Override
    public List<Permission> selectByTypeAndRoleIds(List<Long> roleIds, String permissionType) {
        if (CollectionUtil.isEmpty(roleIds)) {
            return Collections.emptyList();
        }
        return baseMapper.selectByRoleIdsAndType(roleIds, permissionType);
    }

}
