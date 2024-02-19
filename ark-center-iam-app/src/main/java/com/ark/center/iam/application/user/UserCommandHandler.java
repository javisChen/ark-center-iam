package com.ark.center.iam.application.user;

import com.ark.center.iam.application.user.executor.UserCreateCmdExe;
import com.ark.center.iam.application.user.executor.UserUpdateCmdExe;
import com.ark.center.iam.domain.api.vo.ApiPermissionVO;
import com.ark.center.iam.domain.role.service.RoleAssignService;
import com.ark.center.iam.domain.user.User;
import com.ark.center.iam.domain.user.UserFactory;
import com.ark.center.iam.domain.user.repository.UserRepository;
import com.ark.center.iam.domain.user.service.UserDomainService;
import com.ark.center.iam.domain.user.service.UserPermissionService;
import com.ark.center.iam.domain.usergroup.service.UserGroupAssignService;
import com.ark.center.iam.infra.permission.converter.PermissionDomainConverter;
import com.ark.center.iam.infra.user.converter.UserDomainConverter;
import com.ark.center.iam.model.user.command.UserCreateCommand;
import com.ark.center.iam.model.user.command.UserUpdateCommand;
import com.ark.center.iam.model.user.dto.UserApiPermissionDTO;
import com.ark.center.iam.model.user.query.UserPermissionQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserCommandHandler {

    private final UserCreateCmdExe userCreateCmdExe;

    private final UserUpdateCmdExe userUpdateCmdExe;

    private final UserRepository userRepository;

    private final RoleAssignService roleAssignService;

    private final UserGroupAssignService userGroupAssignService;

    private final UserDomainConverter userDomainConverter;

    private final UserPermissionService userPermissionService;

    private final PermissionDomainConverter permissionDomainConverter;

    private final UserFactory userFactory;

    private final UserDomainService userDomainService;


    @Transactional(rollbackFor = Throwable.class)
    public void updateUser(UserUpdateCommand command) {

        log.info("[User]: Begin Update User, User = {}", command);

        String username = command.getUsername();
        String mobile = command.getMobile();
        String password = command.getPassword();
        List<Long> roleIds = command.getRoleIds();
        List<Long> userGroupIds = command.getUserGroupIds();

        User user = userRepository.byIdOrThrowError(command.getId(), "用户不存在");

        userDomainService.update(user, username, mobile, password, roleIds, userGroupIds);

        userRepository.saveAndPublishEvents(user);

    }

    @Transactional(rollbackFor = Throwable.class)
    public Long createUser(UserCreateCommand command) {

        log.info("[User]: Begin Create User, User = {}", command);

        String username = command.getUsername();
        String mobile = command.getMobile();
        String password = command.getPassword();
        List<Long> roleIds = command.getRoleIds();
        List<Long> userGroupIds = command.getUserGroupIds();

        User user = userFactory.create(username, mobile, password, roleIds, userGroupIds);

        userRepository.saveAndPublishEvents(user);

        return user.getId();
    }

    @Transactional(rollbackFor = Throwable.class)
    public void deleteUser(Long userId) {

        User user = userRepository.byIdOrThrowError(userId, "用户不存在");
        // 逻辑删除
        userRepository.deleteAndPublishEvents(user);
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
