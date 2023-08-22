package com.ark.center.iam.adapter.user.web;

import com.ark.center.iam.application.user.UserAppService;
import com.ark.center.iam.client.user.command.UserCmd;
import com.ark.center.iam.client.user.dto.UserDetailsDTO;
import com.ark.center.iam.client.user.dto.UserPageDTO;
import com.ark.center.iam.client.user.query.UserPageQry;
import com.ark.component.dto.PageResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.groups.Default;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


@Schema(description = "用户管理")
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1")
public class UserController extends BaseController {

    private final UserAppService userAppService;

    @GetMapping("/users")
    @Operation(summary = "用户管理 - 分页查询用户信息")
    public SingleResponse<PageResponse<UserPageDTO>> pageQuery(UserPageQry pageQry) {
        return SingleResponse.ok(PageResponse.of(userAppService.pageQuery(pageQry)));
    }

    @PostMapping("/user/create")
    @Operation(summary = "用户管理 - 创建用户")
    public ServerResponse createUser(@RequestBody @Validated({ValidateGroup.Add.class, Default.class}) UserCmd cmd) {
        return SingleResponse.ok(userAppService.createUser(cmd));
    }

    @PostMapping("/user/update")
    @Operation(summary = "用户管理 - 编辑用户")
    public ServerResponse updateUser(@RequestBody @Validated({ValidateGroup.Update.class, Default.class}) UserCmd userCmd) {
        userAppService.updateUser(userCmd);
        return ServerResponse.ok();
    }

    @GetMapping("/user/details")
    @Operation(summary = "用户管理 - 用户详情")
    public SingleResponse<UserDetailsDTO> userDetails(Long id) {
        return SingleResponse.ok(userAppService.userDetails(id));
    }

    @DeleteMapping("/user/delete")
    @Operation(summary = "用户管理 - 删除用户")
    public ServerResponse deleteUser(Long id) {
        userAppService.deleteUser(id);
        return SingleResponse.ok();
    }

}

