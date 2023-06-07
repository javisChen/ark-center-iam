package com.ark.center.iam.domain.role.service;

import com.ark.center.iam.domain.role.gateway.RoleGateway;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RoleAssignService {

    private final RoleGateway roleGateway;

    public void assignUserRoles(Long userId, List<Long> roleIds) {
        roleGateway.insertUserRolesRelations(userId, roleIds);
    }
}
