package com.ark.center.iam.data.user.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ark.center.iam.dao.entity.IamUser;
import com.ark.center.iam.client.permission.vo.PermissionVO;
import com.ark.center.iam.client.user.query.UserPageQry;
import com.ark.center.iam.client.user.command.UserCreateCmd;
import com.ark.center.iam.client.user.vo.UserDetailDTO;
import com.ark.center.iam.client.user.vo.UserPageDTO;

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

    void createUser(UserCreateCmd entity);

    long countUserByCode(String code);

    void updateUserById(UserCreateCmd userCreateCmd);

    Page<UserPageDTO> pageList(UserPageQry pageRequest);

    void updateStatus(UserCreateCmd userCreateCmd);

    IamUser getUserByPhone(String username);

    List<PermissionVO> getUserElements(String userCode);

    IamUser getUserById(Long userId);

    UserDetailDTO getUserDetailVOById(Long userId);

//    User getUserInfoByPhone(String phone);

    IamUser getUserByCode(String userCode);

    void removeUserById(Long id);
}
