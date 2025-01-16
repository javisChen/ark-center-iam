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

    private final UserPermissionService userPermissionService;

    private final PermissionAssembler permissionAssembler;

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

}
