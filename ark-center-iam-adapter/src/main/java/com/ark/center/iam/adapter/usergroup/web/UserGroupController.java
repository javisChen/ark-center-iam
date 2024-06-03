package com.ark.center.iam.adapter.usergroup.web;

import com.ark.center.iam.application.usergroup.UserGroupCommandHandler;
import com.ark.center.iam.application.usergroup.UserGroupQueryService;
import com.ark.center.iam.client.usergroup.command.UserGroupCmd;
import com.ark.center.iam.client.usergroup.dto.UserGroupBaseDTO;
import com.ark.center.iam.client.usergroup.dto.UserGroupDetailDTO;
import com.ark.center.iam.client.usergroup.dto.UserGroupListTreeDTO;
import com.ark.center.iam.client.usergroup.dto.UserGroupTreeDTO;
import com.ark.center.iam.client.usergroup.query.UserGroupQry;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.PageResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import jakarta.validation.groups.Default;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@RestController
@RequestMapping("/v1/userGroups")
public class UserGroupController extends BaseController {

    private final UserGroupQueryService userGroupQueryService;
    private final UserGroupCommandHandler userGroupCommandHandler;

    @GetMapping("")
    public SingleResponse<PageResponse<UserGroupListTreeDTO>> queryGroups(UserGroupQry qry) {
        return SingleResponse.ok(PageResponse.of(userGroupQueryService.queryGroups(qry)));
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
    public MultiResponse<UserGroupTreeDTO> getUserGroupsTree(@RequestBody UserGroupQry dto) {
        return MultiResponse.ok(userGroupQueryService.queryTree(dto));
    }

    @PostMapping("")
    public ServerResponse create(@RequestBody
                                 @Validated({ValidateGroup.Add.class, Default.class}) UserGroupCmd userGroupUpdateDTO) {
        userGroupCommandHandler.createUserGroup(userGroupUpdateDTO);
        return ServerResponse.ok();
    }

    @PutMapping("")
    public ServerResponse update(@RequestBody
                                 @Validated({ValidateGroup.Update.class, Default.class}) UserGroupCmd dto) {
        userGroupCommandHandler.updateUserGroup(dto);
        return ServerResponse.ok();
    }

    @DeleteMapping("")
    public ServerResponse delete(Long id) {
        userGroupCommandHandler.removeUserGroup(id);
        return ServerResponse.ok();
    }

}

