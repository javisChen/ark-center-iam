package com.kt.cloud.iam.data.user.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.kt.cloud.iam.dao.entity.IamUser;
import com.kt.cloud.iam.data.permission.vo.PermissionVO;
import com.kt.cloud.iam.data.user.dto.UserPageListSearchDTO;
import com.kt.cloud.iam.data.user.dto.UserUpdateDTO;
import com.kt.cloud.iam.data.user.vo.UserDetailVO;
import com.kt.cloud.iam.data.user.vo.UserPageListVO;

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

    void saveUser(UserUpdateDTO entity);

    long countUserByCode(String code);

    void updateUserById(UserUpdateDTO userUpdateDTO);

    Page<UserPageListVO> pageList(UserPageListSearchDTO pageRequest);

    void updateStatus(UserUpdateDTO userUpdateDTO);

    IamUser getUserByPhone(String username);

    List<PermissionVO> getUserElements(String userCode);

    IamUser getUserById(Long userId);

    UserDetailVO getUserDetailVOById(Long userId);

//    User getUserInfoByPhone(String phone);

    IamUser getUserByCode(String userCode);

    void removeUserById(Long id);
}
