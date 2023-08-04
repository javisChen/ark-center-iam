package com.ark.center.iam.adapter.user.web;

import com.ark.center.iam.application.user.UserSelfAppService;
import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.security.base.user.LoginUser;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;



@Schema(name = "登录用户", description = "提供登录用户操作")
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1")
public class UserSelfController extends BaseController {

    private final UserSelfAppService userSelfAppService;

    @GetMapping("/user/self")
    @Operation(summary = "登录用户 - 查询登录用户基本信息")
    public SingleResponse<LoginUser> queryUserSelf() {
        return SingleResponse.ok(userSelfAppService.queryUserSelf());
    }

    /**
     * 获取用户菜单权限
     */
    @GetMapping("/user/self/routes")
    @Operation(summary = "登录用户 - 查询登录用户的菜单权限")
    public MultiResponse<UserRouteDTO> queryUserSelfRoutes() {
        List<UserRouteDTO> selfRoutes = userSelfAppService.queryUserSelfRoutes();
        return MultiResponse.ok(selfRoutes);
    }

    /**
     * 获取用户页面元素权限
     */
    @GetMapping("/user/self/elements")
    @Operation(summary = "登录用户 - 查询登录用户的元素权限")
    public MultiResponse<PermissionDTO> queryUserSelfElements() {
        List<PermissionDTO> selfElements = userSelfAppService.queryUserSelfElements();
        return MultiResponse.ok(selfElements);
    }

}

