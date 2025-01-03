package com.ark.center.iam.application.user;

import com.ark.center.iam.application.user.executor.UserCreateCmdExe;
import com.ark.center.iam.application.user.executor.UserQryExe;
import com.ark.center.iam.application.user.executor.UserUpdateCmdExe;
import com.ark.center.iam.client.user.dto.UserAuthDTO;
import com.ark.center.iam.client.user.dto.UserDetailsDTO;
import com.ark.center.iam.client.user.dto.UserPageDTO;
import com.ark.center.iam.client.user.query.UserPageQuery;
import com.ark.center.iam.client.user.query.UserQuery;
import com.ark.center.iam.infra.role.service.RoleAssignService;
import com.ark.center.iam.infra.user.User;
import com.ark.center.iam.infra.user.converter.UserDTOConverter;
import com.ark.center.iam.infra.user.service.UserService;
import com.ark.center.iam.infra.user.service.UserPermissionService;
import com.ark.center.iam.infra.user.support.UserConst;
import com.ark.center.iam.infra.usergroup.service.UserGroupAssignService;
import com.ark.center.iam.infra.permission.assembler.PermissionAssembler;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserQueryService {

    private final UserCreateCmdExe userCreateCmdExe;

    private final UserUpdateCmdExe userUpdateCmdExe;

    private final UserService userGateway;

    private final UserQryExe userQryExe;

    private final RoleAssignService roleAssignService;

    private final UserGroupAssignService userGroupAssignService;

    private final UserDTOConverter userDTOConverter;

    private final UserPermissionService userPermissionService;

    private final PermissionAssembler permissionAssembler;

    public Page<UserPageDTO> queryUsers(UserPageQuery qry) {
        return userQryExe.pageQuery(qry);
    }

    public UserDetailsDTO queryUserDetails(Long userId) {
        return userQryExe.queryUserDetails(userId);
    }

    public UserAuthDTO getUserForAuth(UserQuery userQuery) {
        User user = userQryExe.queryUserByUnique(userQuery);
        if (user == null) {
            return null;
        }
        UserAuthDTO userAuthDTO = userDTOConverter.toUserAuthDTO(user);
        userAuthDTO.setIsSuperAdmin(user.getCode().equals(UserConst.SUPER_ADMIN));
        return userAuthDTO;
    }

}
