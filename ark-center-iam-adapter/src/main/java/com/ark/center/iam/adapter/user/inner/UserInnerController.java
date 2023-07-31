package com.ark.center.iam.adapter.user.inner;

import com.ark.center.iam.application.user.UserAppService;
import com.ark.center.iam.client.user.UserQryApi;
import com.ark.center.iam.client.user.dto.UserInnerDTO;
import com.ark.center.iam.client.user.query.UserQry;
import com.ark.component.dto.SingleResponse;
import com.ark.component.web.base.BaseController;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@Schema(name = "用户管理（内部调用）", description = "提供服务调用接口")
@RequiredArgsConstructor
@RestController
@RequestMapping("/v1/inner/user")
public class UserInnerController extends BaseController implements UserQryApi {

    private final UserAppService userAppService;

//    @Override
//    public SingleResponse<UserInnerDTO> getUserByUserName(String userName) {
//        UserQry userQry = new UserQry();
//        userQry.setUserName(userName);
//        return SingleResponse.ok(userAppService.getUser(userQry));
//    }
//
//    @Override
//    public SingleResponse<UserInnerDTO> getUserByPhone(String phone) {
//        UserQry userQry = new UserQry();
//        userQry.setPhone(phone);
//        return SingleResponse.ok(userAppService.getUser(userQry));
//    }

    @Override
    public SingleResponse<UserInnerDTO> getUser(UserQry userQry) {
        return SingleResponse.ok(userAppService.getUser(userQry));
    }
}

