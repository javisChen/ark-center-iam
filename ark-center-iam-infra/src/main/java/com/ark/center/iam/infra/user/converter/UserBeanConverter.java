package com.ark.center.iam.infra.user.converter;

import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.client.user.command.UserCmd;
import com.ark.center.iam.client.user.dto.UserDetailsDTO;
import com.ark.center.iam.client.user.dto.UserPageDTO;
import com.ark.center.iam.domain.permission.Permission;
import com.ark.center.iam.domain.user.User;
import org.springframework.stereotype.Component;

@Component
public class UserBeanConverter {

    public UserPageDTO convertToUserPageListVO(User user) {
        UserPageDTO userListVO = new UserPageDTO();
        userListVO.setId(user.getId());
        userListVO.setPhone(user.getPhone());
        userListVO.setName(user.getUserName());
        userListVO.setStatus(user.getStatus());
        return userListVO;
    }

    public UserDetailsDTO convertToUserDetailVO(User user) {
        UserDetailsDTO vo = new UserDetailsDTO();
        Long userId = user.getId();
        vo.setId(userId);
        vo.setPhone(user.getPhone());
        vo.setName(user.getUserName());
        vo.setStatus(user.getStatus());
        return vo;
    }

    public PermissionDTO convertToPermissionDTO(Permission permission) {
        PermissionDTO permissionDTO = new PermissionDTO();
        permissionDTO.setPermissionCode(permission.getCode());
        return permissionDTO;
    }

    public User convertToUserDO(UserCmd dto) {
        User user = new User();
        user.setId(dto.getId());
        user.setUserName(dto.getName());
        user.setPhone(dto.getPhone());
        user.setPassword(dto.getPassword());
        user.setStatus(dto.getStatus());
        return user;
    }

    public User convertToUpdateUserDO(UserCmd dto) {
        User user = new User();
        user.setId(dto.getId());
        user.setUserName(dto.getName());
        user.setPhone(dto.getPhone());
        user.setStatus(dto.getStatus());
        return user;
    }

}
