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
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import jakarta.validation.groups.Default;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/v1/userGroups")
public class UserGroupController extends BaseController {

    private final UserGroupQueryService userGroupQueryService;
    private final UserGroupCommandHandler userGroupCommandHandler;

    @GetMapping("")
    public MultiResponse<Tree<Long>> queryGroups(UserGroupQry qry) {
        List<Tree<Long>> trees = userGroupQueryService.queryGroups(qry);
        return MultiResponse.ok(trees);
    }

    @GetMapping("/all")
    public MultiResponse<UserGroupBaseDTO> queryListAll() {
        return MultiResponse.ok(userGroupQueryService.queryListAll());
    }

    @GetMapping("/details")
    public SingleResponse<UserGroupDetailDTO> queryDetails(Long id) {
        return SingleResponse.ok(userGroupQueryService.queryDetails(id));
    }

    @PostMapping("/tree")
    public MultiResponse<Tree<Long>> queryUserGroupsTree(@RequestBody UserGroupQry dto) {
        return MultiResponse.ok(userGroupQueryService.queryTree(dto));
    }

    @PostMapping("")
    public ServerResponse create(@RequestBody
                                 @Validated({ValidateGroup.Add.class, Default.class}) UserGroupCommand command) {
        userGroupCommandHandler.createUserGroup(command);
        return ServerResponse.ok();
    }

    @PutMapping("")
    public ServerResponse update(@RequestBody
                                 @Validated({ValidateGroup.Update.class, Default.class}) UserGroupCommand command) {
        userGroupCommandHandler.updateUserGroup(command);
        return ServerResponse.ok();
    }

    @DeleteMapping("")
    public ServerResponse delete(Long id) {
        userGroupCommandHandler.removeUserGroup(id);
        return ServerResponse.ok();
    }

}

