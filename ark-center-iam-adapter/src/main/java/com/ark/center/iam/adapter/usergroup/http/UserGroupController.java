package com.ark.center.iam.adapter.usergroup.http;

import com.ark.center.iam.application.usergroup.UserGroupCommandHandler;
import com.ark.center.iam.application.usergroup.UserGroupQueryService;
import com.ark.center.iam.model.usergroup.command.UserGroupCreateCommand;
import com.ark.center.iam.model.usergroup.command.UserGroupUpdateCommand;
import com.ark.center.iam.model.usergroup.dto.UserGroupBaseDTO;
import com.ark.center.iam.model.usergroup.dto.UserGroupDetailDTO;
import com.ark.center.iam.model.usergroup.dto.UserGroupListTreeDTO;
import com.ark.center.iam.model.usergroup.dto.UserGroupTreeDTO;
import com.ark.center.iam.model.usergroup.query.UserGroupQuery;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.PageResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@Tag(name = "用户组管理", description = "用户组管理")
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1/userGroups")
public class UserGroupController extends BaseController {

    private final UserGroupCommandHandler userGroupCommandHandler;
    private final UserGroupQueryService userGroupQueryService;

    @GetMapping("")
    @Operation(summary = "查询用户组树结构列表")
    public SingleResponse<PageResponse<UserGroupListTreeDTO>> queryList(@RequestBody UserGroupQuery qry) {
        return SingleResponse.ok(PageResponse.of(userGroupQueryService.queryPage(qry)));
    }

    @GetMapping("/all")
    @Operation(summary = "查询用户组全量数据")
    public MultiResponse<UserGroupBaseDTO> queryListAll() {
        return MultiResponse.ok(userGroupQueryService.queryAll());
    }

    @GetMapping("/details")
    @Operation(summary = "查询用户组详情")
    public SingleResponse<UserGroupDetailDTO> queryDetails(Long id) {
        return SingleResponse.ok(userGroupQueryService.queryDetails(id));
    }

    @PostMapping("/tree")
    @Operation(summary = "查询用户组树结构")
    public MultiResponse<UserGroupTreeDTO> getUserGroupsTree(@RequestBody UserGroupQuery dto) {
        return MultiResponse.ok(userGroupQueryService.queryTree(dto));
    }

    @PostMapping
    @Operation(summary = "创建用户组")
    public ServerResponse create(@RequestBody UserGroupCreateCommand command) {
        userGroupCommandHandler.createUserGroup(command);
        return ServerResponse.ok();
    }

    @PutMapping
    @Operation(summary = "更新用户组")
    public ServerResponse update(@RequestBody UserGroupUpdateCommand command) {
        userGroupCommandHandler.updateUserGroup(command);
        return ServerResponse.ok();
    }

    @DeleteMapping
    @Operation(summary = "删除用户组")
    public ServerResponse delete(Long id) {
        userGroupCommandHandler.delete(id);
        return ServerResponse.ok();
    }

}

