package com.ark.center.iam.adapter.user.web;

import cn.hutool.core.lang.tree.Tree;
import com.ark.center.iam.application.user.UserSelfQueryService;
import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.security.base.user.AuthUser;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@Tag(name = "登录用户相关接口", description = "登录用户接口")
@RequiredArgsConstructor
@RestController
@RequestMapping("/v2/users/self")
public class UserSelfControllerV2 extends BaseController {

    private final UserSelfQueryService userSelfQueryService;

    @GetMapping("")
    @Operation(summary = "查询登录用户基本信息")
    public SingleResponse<AuthUser> queryUserSelf() {
        return SingleResponse.ok(userSelfQueryService.queryUserSelf());
    }

    /**
     * 获取用户菜单权限
     */
    @GetMapping("/menus")
    @Operation(summary = "查询登录用户的菜单权限")
    public MultiResponse<Tree<Long>> queryUserSelfRoutes() {
        List<Tree<Long>> selfRoutes = userSelfQueryService.queryUserSelfRoutesV2();
        return MultiResponse.ok(selfRoutes);
    }

    /**
     * 获取用户页面元素权限
     */
    @GetMapping("/elements")
    @Operation(summary = "查询登录用户的元素权限")
    public MultiResponse<PermissionDTO> queryUserSelfElements() {
        List<PermissionDTO> selfElements = userSelfQueryService.queryUserSelfElements();
        return MultiResponse.ok(selfElements);
    }

}

