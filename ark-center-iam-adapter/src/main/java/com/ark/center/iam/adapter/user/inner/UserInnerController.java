//package com.ark.center.iam.adapter.user.inner;
//
//import com.ark.center.iam.application.user.UserAppService;
//import com.ark.center.iam.client.user.UserPermissionQryApi;
//import com.ark.center.iam.client.user.UserQryApi;
//import com.ark.center.iam.client.user.dto.UserApiPermissionDTO;
//import com.ark.center.iam.client.user.dto.UserInnerDTO;
//import com.ark.center.iam.client.user.query.UserPermissionQry;
//import com.ark.center.iam.client.user.query.UserQry;
//import com.ark.component.dto.MultiResponse;
//import com.ark.component.dto.SingleResponse;
//import com.ark.component.logger.annotation.CatchAndLog;
//import com.ark.component.web.base.BaseController;
//import io.swagger.v3.oas.annotations.tags.Tag;
//import lombok.RequiredArgsConstructor;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//
//@Tag(name = "用户接口（内部调用）", description = "用户接口（内部调用）")
//@RequiredArgsConstructor
//@RestController
//@RequestMapping("/v1/users")
//@CatchAndLog
//public class UserInnerController extends BaseController implements UserQryApi, UserPermissionQryApi {
//
//    private final UserAppService userAppService;
//
//    @Override
//    public SingleResponse<UserInnerDTO> getUser(UserQry userQry) {
//        return SingleResponse.ok(userAppService.getUser(userQry));
//    }
//
//    @Override
//    public SingleResponse<Boolean> hasApiPermission(UserPermissionQry userPermissionQry) {
//        return SingleResponse.ok(userAppService.checkApiHasPermission(userPermissionQry));
//    }
//
//    @Override
//    public MultiResponse<UserApiPermissionDTO> getApiPermissions(Long userId) {
//        return MultiResponse.ok(userAppService.getApiPermissions(userId));
//    }
//}
//
