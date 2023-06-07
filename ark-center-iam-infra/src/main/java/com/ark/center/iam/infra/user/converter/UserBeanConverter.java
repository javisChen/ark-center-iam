package com.ark.center.iam.infra.user.converter;

import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.digest.DigestUtil;
import com.ark.center.iam.client.permission.vo.PermissionVO;
import com.ark.center.iam.client.user.command.UserCreateCmd;
import com.ark.center.iam.client.user.vo.UserDetailDTO;
import com.ark.center.iam.client.user.vo.UserPageDTO;
import com.ark.center.iam.infra.user.gateway.db.IamPermission;
import com.ark.center.iam.domain.user.entity.IamUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@Component
public class UserBeanConverter {

    @Autowired
    private IRoleService iRoleService;
    @Autowired
    private IUserGroupService iUserGroupService;
    @Autowired
    private IUserPasswordHelper iUserPasswordHelper;
    @Autowired
    private IUserService iUserService;

    public UserPageDTO convertToUserPageListVO(IamUser iamUser) {
        Long userId = iamUser.getId();
        List<String> roles = iRoleService.getRoleNamesByUserId(userId);
        List<String> userGroups = iUserGroupService.getUserGroupNamesByUserId(userId);
        UserPageDTO userListVO = new UserPageDTO();
        userListVO.setId(iamUser.getId());
        userListVO.setPhone(iamUser.getPhone());
        userListVO.setName(iamUser.getUserName());
        userListVO.setStatus(iamUser.getStatus());
        userListVO.setRoles(roles);
        userListVO.setUserGroups(userGroups);
        return userListVO;
    }

    public UserDetailDTO convertToUserDetailVO(IamUser user) {
        UserDetailDTO vo = new UserDetailDTO();
        Long userId = user.getId();
        vo.setId(userId);
        vo.setPhone(user.getPhone());
        vo.setName(user.getUserName());
        vo.setStatus(user.getStatus());
        vo.setRoleIds(iRoleService.getRoleIdsByUserId(userId));
        vo.setUserGroupIds(iUserGroupService.getUserGroupIdsByUserId(userId));
        return vo;
    }

    public PermissionVO convertToPermissionVO(IamPermission permission) {
        PermissionVO permissionVO = new PermissionVO();
        permissionVO.setPermissionCode(permission.getCode());
        return permissionVO;
    }

    public IamUser convertToUserDO(UserCreateCmd dto) {
        IamUser iamUser = new IamUser();
        iamUser.setId(dto.getId());
        iamUser.setUserName(dto.getName());
        iamUser.setPhone(dto.getPhone());
        iamUser.setPassword(dto.getPassword());
        iamUser.setStatus(dto.getStatus());
        return iamUser;
    }

    public IamUser convertToUpdateUserDO(UserCreateCmd dto) {
        IamUser iamUser = new IamUser();
        iamUser.setId(dto.getId());
        iamUser.setUserName(dto.getName());
        iamUser.setPhone(dto.getPhone());
        iamUser.setPassword(dto.getPassword());
        iamUser.setStatus(dto.getStatus());
        iamUser.setPassword(iUserPasswordHelper.enhancePassword(DigestUtil.md5Hex(iamUser.getPassword())));
        return iamUser;
    }

    private String generateUserCode() {
        // 生成后先查询一遍，防止生成了重复的code，其实几率微乎其微
        String code;
        do {
            code = StringUtils.remove(StrUtil.uuid(), "-");
        } while (codeExists(code));
        return code;
    }

    private boolean codeExists(String code) {
        return iUserService.countUserByCode(code) > 0;
    }
}
