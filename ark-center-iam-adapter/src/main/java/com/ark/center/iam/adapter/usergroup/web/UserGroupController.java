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
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.groups.Default;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Tag(name = "用户组管理", description = "用户组管理")
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1")
public class UserGroupController extends BaseController {

    private final UserGroupAppService userGroupAppService;

    @PostMapping("/usergroups")
    @Operation(summary = "查询用户组树结构列表")
    public SingleResponse<PageResponse<UserGroupListTreeDTO>> queryList(@RequestBody UserGroupQry qry) {
        return SingleResponse.ok(PageResponse.of(userGroupAppService.queryPage(qry)));
    }

    @GetMapping("/usergroups/all")
    @Operation(summary = "查询用户组全量数据")
    public MultiResponse<UserGroupBaseDTO> queryListAll() {
        return MultiResponse.ok(userGroupAppService.queryListAll());
    }

    @GetMapping("/usergroup")
    @Operation(summary = "查询用户组详情")
    public SingleResponse<UserGroupDetailDTO> queryDetails(Long id) {
        return SingleResponse.ok(userGroupAppService.queryDetails(id));
    }

    @PostMapping("/usergroups/tree")
    @Operation(summary = "查询用户组树结构")
    public MultiResponse<UserGroupTreeDTO> getUserGroupsTree(@RequestBody UserGroupQry dto) {
        return MultiResponse.ok(userGroupAppService.queryTree(dto));
    }

    @PostMapping("/usergroup")
    @Operation(summary = "创建用户组")
    public ServerResponse create(@RequestBody
                              @Validated({ValidateGroup.Add.class, Default.class}) UserGroupCmd userGroupUpdateDTO) {
        userGroupAppService.createUserGroup(userGroupUpdateDTO);
        return ServerResponse.ok();
    }

    @PutMapping("/usergroup")
    @Operation(summary = "更新用户组")
    public ServerResponse update(@RequestBody
                                 @Validated({ValidateGroup.Update.class, Default.class}) UserGroupCmd dto) {
        userGroupAppService.updateUserGroup(dto);
        return ServerResponse.ok();
    }

    @DeleteMapping("/usergroup")
    @Operation(summary = "删除用户组")
    public ServerResponse removeUserGroup(Long id) {
        userGroupAppService.removeUserGroup(id);
        return ServerResponse.ok();
    }

}

