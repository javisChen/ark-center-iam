package com.ark.center.iam.domain.permission.service;

import com.ark.center.iam.domain.permission.Permission;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.gateway.PermissionGateway;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PermissionService {

    private final PermissionGateway permissionGateway;

    public List<Permission> selectByType(PermissionType permissionType) {
        return permissionGateway.selectByType(permissionType.getType());
    }
}
