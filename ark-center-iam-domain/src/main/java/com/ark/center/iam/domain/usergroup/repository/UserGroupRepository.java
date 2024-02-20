package com.ark.center.iam.domain.usergroup.repository;

import com.ark.center.iam.domain.usergroup.UserGroup;
import com.ark.component.ddd.domain.repository.BaseRepository;

import java.util.List;

public interface UserGroupRepository extends BaseRepository<UserGroup, Long> {

    /**
     * 查询用户所在的用户组
     *
     * @param userId        用户id
     * @param includeParent 是否包含父级用户组，如果为是的话，会把有继承父级的用户组也查询出来
     */
    List<Long> selectUserGroupIdsByUserId(Long userId, boolean includeParent);


    boolean existsByName(Long id, String name);
}
