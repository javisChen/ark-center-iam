package com.ark.center.iam.adapter.user.web;

import com.ark.center.iam.application.user.UserAppService;
import com.ark.center.iam.client.user.UserPermissionQryApi;
import com.ark.center.iam.client.user.UserQryApi;
import com.ark.center.iam.client.user.command.UserCmd;
import com.ark.center.iam.client.user.dto.UserApiPermissionDTO;
import com.ark.center.iam.client.user.dto.UserDetailsDTO;
import com.ark.center.iam.client.user.dto.UserInnerDTO;
import com.ark.center.iam.client.user.dto.UserPageDTO;
import com.ark.center.iam.client.user.query.UserPageQry;
import com.ark.center.iam.client.user.query.UserPermissionQry;
import com.ark.center.iam.client.user.query.UserQry;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.PageResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.tags.Tags;
import jakarta.validation.groups.Default;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


@Tags({
        @Tag(name = "用户管理", description = "用户管理"),
})
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1/users/permission")
public class UserPermissionController extends BaseController implements UserPermissionQryApi {

    private final UserAppService userAppService;

    @Override
    public SingleResponse<Boolean> hasApiPermission(UserPermissionQry userPermissionQry) {
        return SingleResponse.ok(userAppService.checkApiHasPermission(userPermissionQry));
    }

    @Override
    public MultiResponse<UserApiPermissionDTO> getApiPermissions(Long userId) {
        return MultiResponse.ok(userAppService.getApiPermissions(userId));
    }
}

