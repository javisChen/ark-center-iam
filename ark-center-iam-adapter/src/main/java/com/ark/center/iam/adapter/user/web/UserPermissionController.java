package com.ark.center.iam.adapter.user.web;

import com.ark.center.iam.application.user.UserPermissionQueryService;
import com.ark.center.iam.client.user.UserPermissionQueryApi;
import com.ark.center.iam.client.user.dto.UserApiPermissionDTO;
import com.ark.center.iam.client.user.query.UserPermissionQuery;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.SingleResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.cloud.openfeign.SpringQueryMap;
import org.springframework.web.bind.annotation.*;

@Tag(name = "用户权限管理", description = "用户权限查询接口")
@RestController
@RequestMapping("/v1/users/permissions")
@RequiredArgsConstructor
public class UserPermissionController implements UserPermissionQueryApi {

    private final UserPermissionQueryService userPermissionQueryService;

    @Override
    public SingleResponse<Boolean> checkApiPermission(@SpringQueryMap UserPermissionQuery query) {
        return SingleResponse.ok(userPermissionQueryService.checkApiPermission(query));
    }

    @Override
    public MultiResponse<UserApiPermissionDTO> queryUserApiPermissions(@RequestParam("userId") Long userId) {
        return MultiResponse.ok(userPermissionQueryService.queryUserApiPermissions(userId));
    }
}

