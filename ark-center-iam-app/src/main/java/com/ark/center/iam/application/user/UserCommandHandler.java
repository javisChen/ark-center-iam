package com.ark.center.iam.application.user;

import com.ark.center.iam.application.user.executor.UserCreateCmdExe;
import com.ark.center.iam.application.user.executor.UserUpdateCmdExe;
import com.ark.center.iam.model.user.command.UserCreateCommand;
import com.ark.center.iam.model.user.command.UserUpdateCommand;
import com.ark.center.iam.model.user.dto.UserApiPermissionDTO;
import com.ark.center.iam.model.user.dto.UserDetailsDTO;
import com.ark.center.iam.model.user.dto.UserInnerDTO;
import com.ark.center.iam.model.user.query.UserPermissionQuery;
import com.ark.center.iam.model.user.query.UserQuery;
import com.ark.center.iam.domain.api.vo.ApiPermissionVO;
import com.ark.center.iam.domain.role.service.RoleAssignService;
import com.ark.center.iam.domain.user.User;
import com.ark.center.iam.domain.user.repository.UserRepository;
import com.ark.center.iam.domain.user.service.UserPermissionService;
import com.ark.center.iam.domain.user.support.UserConst;
import com.ark.center.iam.infra.permission.converter.PermissionDomainConverter;
import com.ark.center.iam.infra.user.converter.UserDomainConverter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserCommandHandler {

    private final UserCreateCmdExe userCreateCmdExe;

    private final UserUpdateCmdExe userUpdateCmdExe;

    private final UserRepository userRepository;

    private final RoleAssignService roleAssignService;

    private final UserGroupAssignService userGroupAssignService;

    private final UserDomainConverter userDomainConverter;

    private final UserPermissionService userPermissionService;

    private final PermissionDomainConverter permissionDomainConverter;


    @Transactional(rollbackFor = Throwable.class)
    public void updateUser(UserUpdateCommand userCreateCommand) {
        userUpdateCmdExe.execute(userCreateCommand);
    }

    @Transactional(rollbackFor = Throwable.class)
    public Long createUser(UserCreateCommand command) {
        return userCreateCmdExe.execute(command);
    }

    @Transactional(rollbackFor = Throwable.class)
    public void deleteUser(Long userId) {
        // 逻辑删除
        userRepository.logicDeleteByUserId(userId);
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
        return permissionDomainConverter.toUserApiPermissionDTO(userApiPermissions);
    }
}
