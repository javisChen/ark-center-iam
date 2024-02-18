package com.ark.center.iam.domain.role.service;

import com.ark.center.iam.domain.role.repository.RoleRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 角色分配服务
 */
@Service
@RequiredArgsConstructor
public class RoleAssignService {

    private final RoleRepository roleRepository;

    /**
     * 用户角色授权
     *
     * @param userId  用户id
     * @param roleIds 角色id集合
     */
    public void assignUserRoles(Long userId, List<Long> roleIds) {
        roleRepository.insertUserRolesRelations(userId, roleIds);
    }

    /**
     * 清除用户角色
     *
     * @param userId 用户id
     */
    public void clearUserRoles(Long userId) {
        roleRepository.deleteUserRoleRelationsByUserId(userId);
    }
}
