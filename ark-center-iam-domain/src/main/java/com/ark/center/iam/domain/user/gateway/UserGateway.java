package com.ark.center.iam.domain.user.gateway;

import com.ark.center.iam.client.user.query.UserPageQry;
import com.ark.center.iam.client.user.vo.UserPageDTO;
import com.ark.center.iam.domain.user.entity.IamUser;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

public interface UserGateway {

    Page<UserPageDTO> selectUsers(UserPageQry qry);

    boolean insert(IamUser iamUser);

    Long countUserByCode(String code);

    Long countUserByPhone(String phone);
}
