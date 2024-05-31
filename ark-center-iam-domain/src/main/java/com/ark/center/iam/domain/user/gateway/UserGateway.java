package com.ark.center.iam.domain.user.gateway;

import com.ark.center.iam.client.user.query.UserPageQuery;
import com.ark.center.iam.client.user.dto.UserPageDTO;
import com.ark.center.iam.domain.user.User;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

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
