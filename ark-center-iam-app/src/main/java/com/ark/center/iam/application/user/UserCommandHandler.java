package com.ark.center.iam.application.user;

import com.ark.center.iam.application.user.executor.UserCreateCmdExe;
import com.ark.center.iam.application.user.executor.UserUpdateCmdExe;
import com.ark.center.iam.client.user.command.UserCommand;
import com.ark.center.iam.infra.role.service.RoleAssignService;
import com.ark.center.iam.infra.user.service.UserService;
import com.ark.center.iam.infra.user.service.UserPermissionService;
import com.ark.center.iam.infra.usergroup.service.UserGroupAssignService;
import com.ark.center.iam.infra.permission.assembler.PermissionAssembler;
import com.ark.component.cache.CacheService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static com.ark.center.iam.infra.user.common.UserCacheKey.CACHE_KEY_USER_ELEMS;
import static com.ark.center.iam.infra.user.common.UserCacheKey.CACHE_KEY_USER_ROUTES;

@Service
@RequiredArgsConstructor
public class UserCommandHandler {

    private final UserCreateCmdExe userCreateCmdExe;

    private final UserUpdateCmdExe userUpdateCmdExe;

    private final UserService userGateway;

    private final RoleAssignService roleAssignService;

    private final UserGroupAssignService userGroupAssignService;

    private final CacheService cacheService;

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

    public void emptyCache(Long userId) {
        cacheService.del(String.format(CACHE_KEY_USER_ROUTES, userId));
        cacheService.del(String.format(CACHE_KEY_USER_ELEMS, userId));
    }
}
