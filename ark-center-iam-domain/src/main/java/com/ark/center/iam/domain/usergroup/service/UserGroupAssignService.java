package com.ark.center.iam.domain.usergroup.service;

import com.ark.center.iam.domain.usergroup.gateway.UserGroupGateway;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户组分配相关业务接口封装
 */
@Service
@RequiredArgsConstructor
public class UserGroupAssignService {

    private final UserGroupGateway userGroupGateway;

    /**
     * 分配
     *
     * @param userId       用户id
     * @param userGroupIds 用户组id集合
     */
    public void assignUserGroups(Long userId, List<Long> userGroupIds) {
        userGroupGateway.insertUserGroupRelations(userId, userGroupIds);
    }

    /**
     * 清除用户和用户组的关系
     *
     * @param userId 用户id
     */
    public void clearUserGroups(Long userId) {
        userGroupGateway.deleteUserGroupRelations(userId);
    }
}
