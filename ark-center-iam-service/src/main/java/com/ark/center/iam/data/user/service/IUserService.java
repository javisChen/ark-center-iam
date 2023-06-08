package com.ark.center.iam.data.user.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ark.center.iam.dao.entity.IamUser;
import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.client.user.query.UserPageQry;
import com.ark.center.iam.client.user.command.UserCmd;
import com.ark.center.iam.client.user.dto.UserDetailsDTO;
import com.ark.center.iam.client.user.dto.UserPageDTO;

import java.util.List;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
public interface IUserService extends IService<IamUser> {

    void createUser(UserCmd entity);

    long countUserByCode(String code);

    void updateUserById(UserCmd userCmd);

    Page<UserPageDTO> pageList(UserPageQry pageRequest);

    void updateStatus(UserCmd userCmd);

    IamUser getUserByPhone(String username);

    List<PermissionDTO> getUserElements(String userCode);

    IamUser getUserById(Long userId);

    UserDetailsDTO getUserDetailVOById(Long userId);

//    User getUserInfoByPhone(String phone);

    IamUser getUserByCode(String userCode);

    void removeUserById(Long id);
}
