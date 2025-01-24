package com.ark.center.iam.application.user;

import com.ark.center.iam.client.user.dto.UserApiPermissionDTO;
import com.ark.center.iam.client.user.query.UserPermissionQuery;
import com.ark.center.iam.infra.api.vo.ApiPermissionVO;
import com.ark.center.iam.infra.permission.assembler.PermissionAssembler;
import com.ark.center.iam.infra.user.service.UserPermissionService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserPermissionQueryService {

    private final UserPermissionService userPermissionService;
    private final PermissionAssembler permissionAssembler;

    public boolean checkApiPermission(UserPermissionQuery query) {
        Long userId = query.getUserId();
        String requestUri = query.getRequestUri();
        String method = query.getMethod();
        return userPermissionService.checkHasApiPermission(userId, requestUri, method);
    }

    public List<UserApiPermissionDTO> queryUserApiPermissions(Long userId) {
        List<ApiPermissionVO> userApiPermissions = userPermissionService.queryUserApiPermissions(userId);
        return permissionAssembler.toUserApiPermissionDTO(userApiPermissions);
    }


}
