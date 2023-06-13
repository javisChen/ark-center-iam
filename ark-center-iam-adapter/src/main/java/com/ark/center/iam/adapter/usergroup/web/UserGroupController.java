package com.ark.center.iam.adapter.usergroup.web;

import com.ark.center.iam.application.usergroup.UserGroupAppService;
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
@RequestMapping("/v1")
public class UserGroupController extends BaseController {

    private final UserGroupAppService userGroupAppService;

    @PostMapping("/usergroups")
    public SingleResponse<PageResponse<UserGroupListTreeDTO>> queryList(@RequestBody UserGroupQry qry) {
        return SingleResponse.ok(PageResponse.of(userGroupAppService.queryPage(qry)));
    }

    @GetMapping("/usergroups/all")
    public MultiResponse<UserGroupBaseDTO> queryListAll() {
        return MultiResponse.ok(userGroupAppService.queryListAll());
    }

    @GetMapping("/usergroup")
    public SingleResponse<UserGroupDetailDTO> queryDetails(Long id) {
        return SingleResponse.ok(userGroupAppService.queryDetails(id));
    }

    @PostMapping("/usergroups/tree")
    public MultiResponse<UserGroupTreeDTO> getUserGroupsTree(@RequestBody UserGroupQry dto) {
        return MultiResponse.ok(userGroupAppService.queryTree(dto));
    }

    @PostMapping("/usergroup")
    public ServerResponse create(@RequestBody
                              @Validated({ValidateGroup.Add.class, Default.class}) UserGroupCmd userGroupUpdateDTO) {
        userGroupAppService.createUserGroup(userGroupUpdateDTO);
        return ServerResponse.ok();
    }

    @PutMapping("/usergroup")
    public ServerResponse update(@RequestBody
                                 @Validated({ValidateGroup.Update.class, Default.class}) UserGroupCmd dto) {
        userGroupAppService.updateUserGroup(dto);
        return ServerResponse.ok();
    }

    @DeleteMapping("/usergroup")
    public ServerResponse removeUserGroup(Long id) {
        userGroupAppService.removeUserGroup(id);
        return ServerResponse.ok();
    }

}

