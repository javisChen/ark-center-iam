//package com.ark.center.iam.domain.usergroup.service;
//
//import cn.hutool.core.collection.CollectionUtil;
//import com.ark.center.iam.domain.usergroup.repository.UserGroupRepository;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//
///**
// * 用户组分配相关业务接口封装
// */
//@Service
//@RequiredArgsConstructor
//public class UserGroupAssignService {
//
//    private final UserGroupRepository userGroupRepository;
//
//    /**
//     * 分配用户到用户组
//     *
//     * @param userId       用户id
//     * @param userGroupIds 用户组id集合
//     */
//    public void assignUserGroupsToUser(Long userId, List<Long> userGroupIds) {
//        userGroupRepository.insertUserGroupAndUserRelations(userId, userGroupIds);
//    }
//
//    /**
//     * 分配角色到用户组
//     *
//     * @param roleIds     角色id
//     * @param userGroupId 用户组id
//     */
//    public void assignUserGroupsToRoles(Long userGroupId, List<Long> roleIds) {
//        if (CollectionUtil.isNotEmpty(roleIds)) {
//            userGroupRepository.insertUserGroupAndRolesRelations(userGroupId, roleIds);
//        }
//    }
//
//    /**
//     * 清除用户和用户组的关系
//     *
//     * @param userId 用户id
//     */
//    public void clearUserAndUserGroupRelations(Long userId) {
//        userGroupRepository.deleteUserGroupAndUserRelationsByUserId(userId);
//    }
//
//    /**
//     * 清除角色和用户组的关系
//     *
//     * @param userGroupId 角色id
//     */
//    public void clearRoleAndUserGroupRelations(Long userGroupId) {
//        userGroupRepository.deleteUserGroupAndRoleRelationsByUserGroupId(userGroupId);
//    }
//}
