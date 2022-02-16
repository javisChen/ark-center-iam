package com.kt.cloud.iam.data.usergroup.controller;

import com.kt.cloud.iam.data.usergroup.dto.UserGroupQueryDTO;
import com.kt.cloud.iam.data.usergroup.dto.UserGroupUpdateDTO;
import com.kt.cloud.iam.data.usergroup.service.IUserGroupService;
import com.kt.component.dto.MultiResponse;
import com.kt.component.dto.PageResponse;
import com.kt.component.dto.ServerResponse;
import com.kt.component.dto.SingleResponse;
import com.kt.component.validator.ValidateGroup;
import com.kt.component.web.base.BaseController;
import com.kt.cloud.iam.data.usergroup.vo.UserGroupBaseVO;
import com.kt.cloud.iam.data.usergroup.vo.UserGroupDetailVO;
import com.kt.cloud.iam.data.usergroup.vo.UserGroupListTreeVO;
import com.kt.cloud.iam.data.usergroup.vo.UserGroupTreeVO;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.groups.Default;

/**
 * <p>
 * 用户组表 前端控制器
 * </p>
 */
@RestController
@RequestMapping("/v1")
public class UserGroupController extends BaseController {

    private final IUserGroupService iUserGroupService;

    public UserGroupController(IUserGroupService iUserGroupService) {
        this.iUserGroupService = iUserGroupService;
    }

    @PostMapping("/usergroups")
    public SingleResponse<PageResponse<UserGroupListTreeVO>> list(@RequestBody UserGroupQueryDTO dto) {
        return SingleResponse.ok(PageResponse.build(iUserGroupService.pageList(dto)));
    }

    @GetMapping("/usergroups/all")
    public MultiResponse<UserGroupBaseVO> list() {
        return MultiResponse.ok(iUserGroupService.listAllVos());
    }

    @GetMapping("/usergroup")
    public SingleResponse<UserGroupDetailVO> list(Long id) {
        return SingleResponse.ok(iUserGroupService.getUserGroupVOById(id));
    }

    @PostMapping("/usergroups/tree")
    public MultiResponse<UserGroupTreeVO> getUserGroupsTree(@RequestBody UserGroupQueryDTO dto) {
        return MultiResponse.ok(iUserGroupService.getTree(dto));
    }

    @PostMapping("/usergroup")
    public ServerResponse add(@RequestBody
                              @Validated({ValidateGroup.Add.class, Default.class}) UserGroupUpdateDTO userGroupUpdateDTO) {
        iUserGroupService.saveUserGroup(userGroupUpdateDTO);
        return ServerResponse.ok();
    }

    @PutMapping("/usergroup")
    public ServerResponse update(@RequestBody
                                 @Validated({ValidateGroup.Update.class, Default.class}) UserGroupUpdateDTO dto) {
        iUserGroupService.updateUserGroupById(dto);
        return ServerResponse.ok();
    }

    @DeleteMapping("/usergroup")
    public ServerResponse removeUserGroup(Long id) {
        iUserGroupService.removeUserGroupById(id);
        return ServerResponse.ok();
    }

}

