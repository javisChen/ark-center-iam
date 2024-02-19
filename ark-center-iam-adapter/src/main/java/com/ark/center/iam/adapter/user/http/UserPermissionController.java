package com.ark.center.iam.adapter.user.http;

import com.ark.center.iam.application.user.UserQueryService;
import com.ark.center.iam.model.user.UserPermissionQueryApi;
import com.ark.center.iam.model.user.dto.UserApiPermissionDTO;
import com.ark.center.iam.model.user.query.UserPermissionQuery;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "用户管理", description = "用户管理")
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1/users/permission")
public class UserPermissionController extends BaseController implements UserPermissionQueryApi {

    private final UserQueryService userQueryService;

    @Override
    public SingleResponse<Boolean> checkApiHasPermission(UserPermissionQuery query) {
        return SingleResponse.ok(userQueryService.checkApiHasPermission(query));
    }

    @Override
    public MultiResponse<UserApiPermissionDTO> queryApiPermissions(Long userId) {
        return MultiResponse.ok(userQueryService.queryApiPermissions(userId));
    }
}

