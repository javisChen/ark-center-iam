package com.ark.center.iam.adapter.user.web;

import com.ark.center.iam.application.user.UserCommandHandler;
import com.ark.center.iam.client.user.UserPermissionQueryApi;
import com.ark.center.iam.client.user.dto.UserApiPermissionDTO;
import com.ark.center.iam.client.user.query.UserPermissionQuery;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.tags.Tags;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;


@Tags({
        @Tag(name = "用户管理", description = "用户管理"),
})
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1/users/permission")
public class UserPermissionController extends BaseController implements UserPermissionQueryApi {

    private final UserCommandHandler userCommandHandler;

    @Override
    public SingleResponse<Boolean> hasApiPermission(UserPermissionQuery userPermissionQuery) {
        return SingleResponse.ok(userCommandHandler.checkApiHasPermission(userPermissionQuery));
    }

    @Override
    public MultiResponse<UserApiPermissionDTO> getApiPermissions(Long userId) {
        return MultiResponse.ok(userCommandHandler.getApiPermissions(userId));
    }
}

