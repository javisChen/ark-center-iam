package com.ark.center.iam.application.user;

import com.ark.center.iam.application.user.executor.UserCreateCmdExe;
import com.ark.center.iam.application.user.executor.UserQryExe;
import com.ark.center.iam.application.user.executor.UserUpdateCmdExe;
import com.ark.center.iam.client.user.dto.UserDetailsDTO;
import com.ark.center.iam.client.user.dto.UserInnerDTO;
import com.ark.center.iam.client.user.dto.UserPageDTO;
import com.ark.center.iam.client.user.query.UserPageQuery;
import com.ark.center.iam.client.user.query.UserQuery;
import com.ark.center.iam.domain.role.service.RoleAssignService;
import com.ark.center.iam.domain.user.User;
import com.ark.center.iam.domain.user.gateway.UserGateway;
import com.ark.center.iam.domain.user.service.UserPermissionService;
import com.ark.center.iam.domain.user.support.UserConst;
import com.ark.center.iam.domain.usergroup.service.UserGroupAssignService;
import com.ark.center.iam.infra.permission.assembler.PermissionAssembler;
import com.ark.center.iam.infra.user.converter.UserBeanConverter;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserQueryService {

    private final UserCreateCmdExe userCreateCmdExe;

    private final UserUpdateCmdExe userUpdateCmdExe;

    private final UserGateway userGateway;

    private final UserQryExe userQryExe;

    private final RoleAssignService roleAssignService;

    private final UserGroupAssignService userGroupAssignService;

    private final UserBeanConverter userBeanConverter;

    private final UserPermissionService userPermissionService;

    private final PermissionAssembler permissionAssembler;


    public Page<UserPageDTO> queryPages(UserPageQuery qry) {
        return userQryExe.pageQuery(qry);
    }
    public UserDetailsDTO userDetails(Long userId) {
        return userQryExe.queryUserDetails(userId);
    }

    public UserInnerDTO getUser(UserQuery userQuery) {
        User user = userQryExe.queryUserByUnique(userQuery);
        if (user == null) {
            return null;
        }
        UserInnerDTO userInnerDTO = userBeanConverter.toUserInnerDTO(user);
        userInnerDTO.setIsSuperAdmin(user.getCode().equals(UserConst.SUPER_ADMIN));
        return userInnerDTO;
    }

}
