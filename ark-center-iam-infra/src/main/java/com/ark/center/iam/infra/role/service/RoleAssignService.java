package com.ark.center.iam.infra.role.service;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 角色分配服务
 */
@Service
@RequiredArgsConstructor
public class RoleAssignService {

    private final RoleService roleGateway;

    /**
     * 用户角色授权
     *
     * @param userId  用户id
     * @param roleIds 角色id集合
     */
    public void assignUserRoles(Long userId, List<Long> roleIds) {
        roleGateway.insertUserRolesRelations(userId, roleIds);
    }

    /**
     * 清除用户角色
     *
     * @param userId 用户id
     */
    public void clearUserRoles(Long userId) {
        roleGateway.deleteUserRoleRelationsByUserId(userId);
    }
}
