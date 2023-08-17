package com.ark.center.iam.domain.user.gateway;

import com.ark.center.iam.client.user.query.UserPageQry;
import com.ark.center.iam.client.user.dto.UserPageDTO;
import com.ark.center.iam.domain.user.User;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;

public interface UserGateway {

    Page<UserPageDTO> selectUsers(UserPageQry qry);

    boolean insert(User user);

    Long countUserByCode(String code);

    Long countUserByPhone(String phone);

    boolean updateByUserId(User user);

    User selectByUserId(Long userId);

    void logicDeleteByUserId(Long userId);

    User selectByUserCode(String userCode);

    User selectByPhone(String phone);

    User selectByUsername(String username);

    List<User> selectByRoleId(Long roleId);
}
