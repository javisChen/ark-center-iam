package com.ark.center.iam.adapter.user.web;

import com.ark.center.iam.application.user.UserSelfAppService;
import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.security.base.user.LoginUserContext;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;



@Schema(name = "登录用户", description = "提供登录用户操作")
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1")
public class UserSelfController extends BaseController {

    private final UserSelfAppService userSelfAppService;

    @GetMapping("/user/self")
    @Operation(summary = "登录用户 - 查询登录用户基本信息")
    public SingleResponse<LoginUserContext> queryUserSelf() {
        return SingleResponse.ok(userSelfAppService.queryUserSelf());
    }

    /**
     * 获取用户菜单权限
     */
    @GetMapping("/user/self/routes")
    public MultiResponse<UserRouteDTO> queryUserSelfRoutes() {
        List<UserRouteDTO> selfRoutes = userSelfAppService.queryUserSelfRoutes();
        return MultiResponse.ok(selfRoutes);
    }

    /**
     * 获取用户页面元素权限
     */
    @GetMapping("/user/self/elements")
    public MultiResponse<PermissionDTO> queryUserSelfElements() {
        List<PermissionDTO> selfElements = userSelfAppService.queryUserSelfElements();
        return MultiResponse.ok(selfElements);
    }

}

