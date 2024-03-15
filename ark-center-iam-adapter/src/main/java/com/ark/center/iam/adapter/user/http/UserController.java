package com.ark.center.iam.adapter.user.http;

import com.ark.center.iam.application.user.UserCommandHandler;
import com.ark.center.iam.application.user.UserQueryService;
import com.ark.center.iam.client.user.UserQueryApi;
import com.ark.center.iam.model.user.command.UserCreateCommand;
import com.ark.center.iam.model.user.command.UserUpdateCommand;
import com.ark.center.iam.model.user.dto.UserDetailsDTO;
import com.ark.center.iam.model.user.dto.UserInnerDTO;
import com.ark.center.iam.model.user.dto.UserPageDTO;
import com.ark.center.iam.model.user.query.UserPageQuery;
import com.ark.center.iam.model.user.query.UserQuery;
import com.ark.component.dto.PageResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@Tag(name = "用户", description = "用户管理接口")
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1/users")
public class UserController extends BaseController implements UserQueryApi {

    private final UserCommandHandler userCommandHandler;
    private final UserQueryService userQueryService;

    @PostMapping("/create")
    @Operation(summary = "创建用户")
    public ServerResponse createUser(@RequestBody UserCreateCommand command) {
        Long userId = userCommandHandler.createUser(command);
        return SingleResponse.ok(userId);
    }

    @PutMapping("/update")
    @Operation(summary = "编辑用户")
    public ServerResponse updateUser(@RequestBody UserUpdateCommand command) {
        userCommandHandler.updateUser(command);
        return ServerResponse.ok();
    }
    @GetMapping("/pages")
    @Operation(summary = "分页查询用户信息")
    public SingleResponse<PageResponse<UserPageDTO>> queryPages(UserPageQuery query) {
        return SingleResponse.ok(PageResponse.of(userQueryService.queryPages(query)));
    }

    @GetMapping("/details")
    @Operation(summary = "用户详情")
    public SingleResponse<UserDetailsDTO> queryDetails(Long id) {
        return SingleResponse.ok(userQueryService.queryDetails(id));
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除用户")
    public ServerResponse deleteUser(Long id) {
        userCommandHandler.deleteUser(id);
        return SingleResponse.ok();
    }

    @Override
    public SingleResponse<UserInnerDTO> queryBasicInfo(UserQuery userQuery) {
        UserInnerDTO user = userQueryService.queryBasicInfo(userQuery);
        return SingleResponse.ok(user);
    }

}

