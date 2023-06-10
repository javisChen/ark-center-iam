package com.ark.center.iam.domain.permission.gateway;


import com.ark.center.iam.domain.permission.Permission;

import java.util.List;

public interface PermissionGateway {

    List<Permission> selectByType(String permissionType);

    List<Permission> selectByTypeAndRoleIds(List<Long> roleIds, String permissionType);

    void insert(Permission permission);
}
