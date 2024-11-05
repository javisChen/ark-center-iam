package com.ark.center.iam.adapter.usergroup.web;

import cn.hutool.core.lang.tree.Tree;
import com.ark.center.iam.application.usergroup.UserGroupCommandHandler;
import com.ark.center.iam.application.usergroup.UserGroupQueryService;
import com.ark.center.iam.client.usergroup.command.UserGroupCommand;
import com.ark.center.iam.client.usergroup.dto.UserGroupBaseDTO;
import com.ark.center.iam.client.usergroup.dto.UserGroupDetailDTO;
import com.ark.center.iam.client.usergroup.query.UserGroupQry;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name = "用户组", description = "用户组")
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1/user-groups")
public class UserGroupController extends BaseController {

    private final UserGroupQueryService userGroupQueryService;
    private final UserGroupCommandHandler userGroupCommandHandler;

    @GetMapping("")
    @Operation(summary = "查询树形结构数据")
    public MultiResponse<Tree<Long>> queryGroups(UserGroupQry qry) {
        List<Tree<Long>> trees = userGroupQueryService.queryGroups(qry);
        return MultiResponse.ok(trees);
    }

    @GetMapping("/all")
    @Operation(summary = "全量查询")
    public MultiResponse<UserGroupBaseDTO> queryListAll() {
        return MultiResponse.ok(userGroupQueryService.queryListAll());
    }

    @GetMapping("/details")
    @Operation(summary = "用户组-详情查询")
    public SingleResponse<UserGroupDetailDTO> queryDetails(Long id) {
        return SingleResponse.ok(userGroupQueryService.queryDetails(id));
    }

    @PostMapping("/tree")
    public MultiResponse<Tree<Long>> queryUserGroupsTree(@RequestBody UserGroupQry dto) {
        return MultiResponse.ok(userGroupQueryService.queryTree(dto));
    }

    @PostMapping("")
    @Operation(summary = "新增用户组")
    public ServerResponse create(@RequestBody UserGroupCommand command) {
        userGroupCommandHandler.save(command);
        return ServerResponse.ok();
    }

    @PutMapping("")
    @Operation(summary = "修改用户组")
    public ServerResponse update(@RequestBody UserGroupCommand command) {
        userGroupCommandHandler.save(command);
        return ServerResponse.ok();
    }

    @DeleteMapping("")
    @Operation(summary = "删除用户组")
    public ServerResponse delete(Long id) {
        userGroupCommandHandler.delete(id);
        return ServerResponse.ok();
    }

}

