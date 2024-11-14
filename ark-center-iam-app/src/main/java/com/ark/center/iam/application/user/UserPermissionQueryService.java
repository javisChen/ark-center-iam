package com.ark.center.iam.application.user;

import com.ark.center.iam.application.user.executor.UserCreateCmdExe;
import com.ark.center.iam.application.user.executor.UserUpdateCmdExe;
import com.ark.center.iam.client.user.command.UserCommand;
import com.ark.center.iam.client.user.dto.UserApiPermissionDTO;
import com.ark.center.iam.client.user.query.UserPermissionQuery;
import com.ark.center.iam.infra.api.vo.ApiPermissionVO;
import com.ark.center.iam.infra.permission.assembler.PermissionAssembler;
import com.ark.center.iam.infra.role.service.RoleAssignService;
import com.ark.center.iam.infra.user.service.UserService;
import com.ark.center.iam.infra.user.service.UserPermissionService;
import com.ark.center.iam.infra.usergroup.service.UserGroupAssignService;
import com.ark.component.cache.CacheService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.ark.center.iam.infra.user.common.UserCacheKey.CACHE_KEY_USER_ELEMS;
import static com.ark.center.iam.infra.user.common.UserCacheKey.CACHE_KEY_USER_ROUTES;

@Service
@RequiredArgsConstructor
public class UserPermissionQueryService {

    private final UserCreateCmdExe userCreateCmdExe;

    private final UserUpdateCmdExe userUpdateCmdExe;

    private final UserService userGateway;

    private final RoleAssignService roleAssignService;

    private final UserGroupAssignService userGroupAssignService;

    private final UserPermissionService userPermissionService;

    private final PermissionAssembler permissionAssembler;

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

    public Boolean checkApiHasPermission(UserPermissionQuery userPermissionQuery) {
        Long userId = userPermissionQuery.getUserId();
        String requestUri = userPermissionQuery.getRequestUri();
        String method = userPermissionQuery.getMethod();
        return userPermissionService.checkHasApiPermission(userId, requestUri, method);
    }

    public List<UserApiPermissionDTO> queryApiPermissions(Long userId) {
        List<ApiPermissionVO> userApiPermissions = userPermissionService.queryUserApiPermissions(userId);
        return permissionAssembler.toUserApiPermissionDTO(userApiPermissions);
    }

    public void emptyCache(Long userId) {
        cacheService.del(String.format(CACHE_KEY_USER_ROUTES, userId));
        cacheService.del(String.format(CACHE_KEY_USER_ELEMS, userId));
    }
}
