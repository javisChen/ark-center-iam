package com.kt.cloud.iam.data.user.controller;


import com.kt.cloud.iam.data.permission.vo.PermissionVO;
import com.kt.cloud.iam.data.user.dto.UserPageListSearchDTO;
import com.kt.cloud.iam.data.user.dto.UserUpdateDTO;
import com.kt.cloud.iam.data.user.service.IUserPermissionService;
import com.kt.cloud.iam.data.user.service.IUserService;
import com.kt.cloud.iam.data.user.vo.UserDetailVO;
import com.kt.cloud.iam.data.user.vo.UserPageListVO;
import com.kt.cloud.iam.data.user.vo.UserPermissionRouteNavVO;
import com.kt.component.context.LoginUserContext;
import com.kt.component.context.ServiceContext;
import com.kt.component.dto.MultiResponse;
import com.kt.component.dto.PageResponse;
import com.kt.component.dto.ServerResponse;
import com.kt.component.dto.SingleResponse;
import com.kt.component.validator.ValidateGroup;
import com.kt.component.web.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.groups.Default;
import java.util.List;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author Javis
 * @since 2020-11-09
 */
@RestController
@RequestMapping("/v1")
public class UserController extends BaseController {

    @Autowired
    private IUserService iUserService;
    @Autowired
    private IUserPermissionService iUserPermissionService;

    /**
     * 查看用户列表
     */
    @PostMapping("/users")
    public SingleResponse<PageResponse<UserPageListVO>> list(@RequestBody UserPageListSearchDTO pageRequest) {
        return SingleResponse.ok(PageResponse.build(iUserService.pageList(pageRequest)));
    }

    /**
     * 添加用户
     */
    @PostMapping("/user/create")
    public ServerResponse add(@RequestBody @Validated({ValidateGroup.Add.class, Default.class}) UserUpdateDTO dto) {
        iUserService.saveUser(dto);
        return SingleResponse.ok();
    }

    /**
     * 编辑用户
     */
    @PostMapping("/user/update")
    public ServerResponse update(@RequestBody
                                 @Validated({ValidateGroup.Update.class, Default.class}) UserUpdateDTO userUpdateDTO) {
        iUserService.updateUserById(userUpdateDTO);
        return ServerResponse.ok();
    }

    /**
     * 查看用户详情
     */
    @GetMapping("/user")
    public SingleResponse<UserDetailVO> get(Long id) {
        return SingleResponse.ok(iUserService.getUserDetailVOById(id));
    }

    /**
     * 查看用户详情
     */
    @DeleteMapping("/user")
    public ServerResponse delete(Long id) {
        iUserService.removeUserById(id);
        return SingleResponse.ok();
    }

    /**
     * 查看用户基本信息
     */
    @GetMapping("/user/info")
    public SingleResponse<LoginUserContext> getLoginUserInfo() {
        LoginUserContext loginUserContext = ServiceContext.getCurrentUser();
        return SingleResponse.ok(loginUserContext);
    }

    /**
     * 获取用户菜单权限
     */
    @GetMapping("/user/permission/routes")
    public MultiResponse<UserPermissionRouteNavVO> getUserRoutePermission() {
        String userCode = ServiceContext.getCurrentUser().getUserCode();
        List<UserPermissionRouteNavVO> userRoutes = iUserPermissionService.getUserRoutes(userCode);
        return MultiResponse.ok(userRoutes);
    }

    /**
     * 获取用户页面元素权限
     */
    @GetMapping("/user/permission/elements")
    public MultiResponse<PermissionVO> getUserElementPermission() {
        String userCode = ServiceContext.getCurrentUser().getUserCode();
        List<PermissionVO> userRoutes = iUserPermissionService.getUserPermissionPageElements(userCode);
        return MultiResponse.ok(userRoutes);
    }

}

