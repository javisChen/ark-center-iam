package com.ark.center.iam.application.user;

import com.ark.center.iam.application.user.executor.UserCreateCmdExe;
import com.ark.center.iam.application.user.executor.UserQryExe;
import com.ark.center.iam.application.user.executor.UserUpdateCmdExe;
import com.ark.center.iam.client.user.command.UserCommand;
import com.ark.center.iam.client.user.dto.UserApiPermissionDTO;
import com.ark.center.iam.client.user.dto.UserDetailsDTO;
import com.ark.center.iam.client.user.dto.UserInnerDTO;
import com.ark.center.iam.client.user.dto.UserPageDTO;
import com.ark.center.iam.client.user.query.UserPageQuery;
import com.ark.center.iam.client.user.query.UserPermissionQuery;
import com.ark.center.iam.client.user.query.UserQuery;
import com.ark.center.iam.domain.api.vo.ApiPermissionVO;
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
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserCommandHandler {

    private final UserCreateCmdExe userCreateCmdExe;

    private final UserUpdateCmdExe userUpdateCmdExe;

    private final UserGateway userGateway;

    private final RoleAssignService roleAssignService;

    private final UserGroupAssignService userGroupAssignService;

    private final UserPermissionService userPermissionService;

    private final PermissionAssembler permissionAssembler;


    @Transactional(rollbackFor = Throwable.class)
    public Long createUser(UserCommand command) {
        return userCreateCmdExe.execute(command);
    }

    @Transactional(rollbackFor = Throwable.class)
    public void updateUser(UserCommand command) {
        userUpdateCmdExe.execute(command);
    }

    @Transactional(rollbackFor = Throwable.class)
    public void deleteUser(Long userId) {
        // 逻辑删除
        userGateway.logicDeleteByUserId(userId);
        // 移除角色关系
        roleAssignService.clearUserRoles(userId);
        // 移除用户组关系
        userGroupAssignService.clearUserAndUserGroupRelations(userId);
    }

    public Boolean checkApiHasPermission(UserPermissionQuery userPermissionQuery) {
        Long userId = userPermissionQuery.getUserId();
        String requestUri = userPermissionQuery.getRequestUri();
        String method = userPermissionQuery.getMethod();
        return userPermissionService.checkHasApiPermission(userId, requestUri, method);
    }

    public List<UserApiPermissionDTO> getApiPermissions(Long userId) {
        List<ApiPermissionVO> userApiPermissions = userPermissionService.getUserApiPermissions(userId);
        return permissionAssembler.toUserApiPermissionDTO(userApiPermissions);
    }
}
