package com.ark.center.iam.data.usergroup.controller;

import com.ark.center.iam.data.usergroup.dto.UserGroupQueryDTO;
import com.ark.center.iam.data.usergroup.dto.UserGroupUpdateDTO;
import com.ark.center.iam.data.usergroup.service.IUserGroupService;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.PageResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import com.ark.center.iam.data.usergroup.vo.UserGroupBaseVO;
import com.ark.center.iam.data.usergroup.vo.UserGroupDetailVO;
import com.ark.center.iam.data.usergroup.vo.UserGroupListTreeVO;
import com.ark.center.iam.data.usergroup.vo.UserGroupTreeVO;
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
        return SingleResponse.ok(PageResponse.of(iUserGroupService.pageList(dto)));
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

