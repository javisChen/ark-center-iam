package com.ark.center.iam.domain.user.repository;

import com.ark.center.iam.domain.user.User;
import com.ark.component.ddd.domain.repository.BaseRepository;

import java.util.List;

public interface UserRepository extends BaseRepository<User, Long> {


    Long countUserByCode(String code);

    Long countUserByMobile(String mobile);

    boolean updateByUserId(User user);

    User selectByUserId(Long userId);

    void logicDeleteByUserId(Long userId);

    List<User> selectByRoleId(Long roleId);
}
