package com.ark.center.iam.domain.usergroup.gateway;

import com.ark.center.iam.domain.usergroup.vo.UserGroupVO;

import java.util.List;

public interface UserGroupGateway {
    void insertUserGroupRelations(Long userId, List<Long> userGroupIds);

    void deleteUserGroupRelations(Long userId);


    /**
     * 查询用户所在的用户组（只获取用户直属的用户组）
     *
     * @param userId 用户id
     */
    List<Long> selectUserGroupIdsByUserId(Long userId);

    /**
     * 查询用户所在的用户组
     *
     * @param userId        用户id
     * @param includeParent 是否包含父级用户组，如果为是的话，会把有继承父级的用户组也查询出来
     */
    List<Long> selectUserGroupIdsByUserId(Long userId, boolean includeParent);

    List<UserGroupVO> selectUserGroupsByUserIds(List<Long> userIds);
}
