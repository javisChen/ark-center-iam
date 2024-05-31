package com.ark.center.iam.adapter.user.web;

import com.ark.center.iam.application.user.UserCommandHandler;
import com.ark.center.iam.application.user.UserQueryService;
import com.ark.center.iam.client.user.UserQueryApi;
import com.ark.center.iam.client.user.command.UserCommand;
import com.ark.center.iam.client.user.dto.UserDetailsDTO;
import com.ark.center.iam.client.user.dto.UserInnerDTO;
import com.ark.center.iam.client.user.dto.UserPageDTO;
import com.ark.center.iam.client.user.query.UserPageQuery;
import com.ark.center.iam.client.user.query.UserQuery;
import com.ark.component.dto.PageResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.validator.ValidateGroup;
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
@RequestMapping("/v1/users")
public class UserController implements UserQueryApi {

    private final UserCommandHandler userCommandHandler;
    private final UserQueryService userQueryService;

    @GetMapping("/pages")
    @Operation(summary = "分页查询用户信息")
    public SingleResponse<PageResponse<UserPageDTO>> pageQuery(UserPageQuery pageQry) {
        return SingleResponse.ok(PageResponse.of(userQueryService.queryPages(pageQry)));
    }

    @PostMapping("/create")
    @Operation(summary = "创建用户")
    public ServerResponse createUser(@RequestBody @Validated() UserCommand cmd) {
        return SingleResponse.ok(userCommandHandler.createUser(cmd));
    }

    @PostMapping("/update")
    @Operation(summary = "编辑用户")
    public ServerResponse updateUser(@RequestBody @Validated({ValidateGroup.Update.class, Default.class}) UserCommand userCommand) {
        userCommandHandler.updateUser(userCommand);
        return ServerResponse.ok();
    }

    @GetMapping("/details")
    @Operation(summary = "用户详情")
    public SingleResponse<UserDetailsDTO> userDetails(Long id) {
        return SingleResponse.ok(userQueryService.userDetails(id));
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除用户")
    public ServerResponse deleteUser(Long id) {
        userCommandHandler.deleteUser(id);
        return SingleResponse.ok();
    }

    @Override
    public SingleResponse<UserInnerDTO> queryUserSimpleInfo(UserQuery userQuery) {
        return SingleResponse.ok(userQueryService.getUser(userQuery));
    }

}

