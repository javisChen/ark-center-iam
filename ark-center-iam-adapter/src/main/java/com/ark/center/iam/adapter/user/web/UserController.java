package com.ark.center.iam.adapter.user.web;

import com.ark.center.iam.application.user.UserAppService;
import com.ark.center.iam.client.permission.vo.PermissionVO;
import com.ark.center.iam.client.user.query.UserPageQry;
import com.ark.center.iam.client.user.command.UserCreateCmd;
import com.ark.center.iam.data.user.service.IUserPermissionService;
import com.ark.center.iam.data.user.service.IUserService;
import com.ark.center.iam.client.user.vo.UserDetailDTO;
import com.ark.center.iam.client.user.vo.UserPageDTO;
import com.ark.center.iam.client.user.vo.UserPermissionRouteNavVO;
import com.ark.component.context.core.ServiceContext;
import com.ark.component.dto.MultiResponse;
import com.ark.component.dto.PageResponse;
import com.ark.component.dto.ServerResponse;
import com.ark.component.dto.SingleResponse;
import com.ark.component.security.base.user.LoginUserContext;
import com.ark.component.validator.ValidateGroup;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import jakarta.validation.groups.Default;

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
    @Autowired
    private UserAppService userAppService;
    @PostMapping("/users")
    @Operation(summary = "用户管理 - 分页查询用户信息")
    public SingleResponse<PageResponse<UserPageDTO>> paging(@RequestBody UserPageQry pageQry) {
        return SingleResponse.ok(PageResponse.of(userAppService.pageQuery(pageQry)));
    }

    /**
     * 添加用户
     */
    @PostMapping("/user/create")
    public ServerResponse add(@RequestBody @Validated({ValidateGroup.Add.class, Default.class}) UserCreateCmd cmd) {
        userAppService.createUser(cmd);
        iUserService.createUser(cmd);
        return SingleResponse.ok();
    }

    /**
     * 编辑用户
     */
    @PostMapping("/user/update")
    public ServerResponse update(@RequestBody
                                 @Validated({ValidateGroup.Update.class, Default.class}) UserCreateCmd userCreateCmd) {
        userAppService.updateUser(userCreateCmd);
        iUserService.updateUserById(userCreateCmd);
        return ServerResponse.ok();
    }

    /**
     * 查看用户详情
     */
    @GetMapping("/user")
    public SingleResponse<UserDetailDTO> get(Long id) {
        return SingleResponse.ok(iUserService.getUserDetailVOById(id));
    }

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

