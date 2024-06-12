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

    @GetMapping
    @Operation(summary = "查询用户列表")
    public SingleResponse<PageResponse<UserPageDTO>> queryUsers(UserPageQuery query) {
        return SingleResponse.ok(PageResponse.of(userQueryService.queryUsers(query)));
    }

    @GetMapping("/details")
    @Operation(summary = "用户详情")
    public SingleResponse<UserDetailsDTO> queryUserDetails(Long id) {
        return SingleResponse.ok(userQueryService.queryUserDetails(id));
    }

    @PostMapping
    @Operation(summary = "新建用户")
    public ServerResponse createUser(@RequestBody
                                     @Validated({ValidateGroup.Add.class, Default.class}) UserCommand command) {
        return SingleResponse.ok(userCommandHandler.createUser(command));
    }

    @PutMapping
    @Operation(summary = "编辑用户")
    public ServerResponse updateUser(@RequestBody
                                     @Validated({ValidateGroup.Update.class, Default.class}) UserCommand command) {
        userCommandHandler.updateUser(command);
        return ServerResponse.ok();
    }

    @DeleteMapping
    @Operation(summary = "删除用户")
    public ServerResponse deleteUser(Long id) {
        userCommandHandler.deleteUser(id);
        return SingleResponse.ok();
    }

    @Override
    public SingleResponse<UserInnerDTO> queryUserSimpleInfo(UserQuery query) {
        return SingleResponse.ok(userQueryService.getUser(query));
    }

}

