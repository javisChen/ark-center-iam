//package com.ark.center.iam.adapter.user.inner;
//
//import com.ark.center.iam.application.user.UserQueryService;
//import com.ark.center.iam.model.user.UserPermissionQueryApi;
//import com.ark.center.iam.model.user.UserQueryApi;
//import com.ark.center.iam.model.user.dto.UserApiPermissionDTO;
//import com.ark.center.iam.model.user.dto.UserInnerDTO;
//import com.ark.center.iam.model.user.query.UserPermissionQuery;
//import com.ark.center.iam.model.user.query.UserQuery;
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
//public class UserInnerController extends BaseController implements UserQueryApi, UserPermissionQueryApi {
//
//    private final UserQueryService userQueryService;
//
//    @Override
//    public SingleResponse<UserInnerDTO> queryBasicInfo(UserQuery userQuery) {
//        return SingleResponse.ok(userQueryService.queryBasicInfo(userQuery));
//    }
//
//    @Override
//    public SingleResponse<Boolean> checkApiHasPermission(UserPermissionQuery query) {
//        return SingleResponse.ok(userQueryService.checkApiHasPermission(query));
//    }
//
//    @Override
//    public MultiResponse<UserApiPermissionDTO> queryApiPermissions(Long userId) {
//        return MultiResponse.ok(userQueryService.queryApiPermissions(userId));
//    }
//}
//
