package com.ark.center.iam.infra.user.gateway;

import com.ark.center.iam.infra.user.User;

import java.util.List;

public interface UserGateway {

    boolean insert(User user);

    Long countUserByCode(String code);

    Long countUserByMobile(String mobile);

    boolean updateByUserId(User user);

    User selectByUserId(Long userId);

    void logicDeleteByUserId(Long userId);

    List<User> selectByRoleId(Long roleId);
}
