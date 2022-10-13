package com.ark.center.iam.api.user.permission.response;

import com.ark.component.dto.BizErrorCode;
import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * 权限校验响应体
 */
@Data
@AllArgsConstructor
public class ApiAuthResponse {

    private String code;
    private Boolean hasPermission;
    private LoginUserResponse loginUserResponse;
    private String msg;

    public ApiAuthResponse(String code, Boolean hasPermission, String msg) {
        this.code = code;
        this.hasPermission = hasPermission;
        this.msg = msg;
    }

    public ApiAuthResponse(String code, Boolean hasPermission, LoginUserResponse loginUserResponse) {
        this.code = code;
        this.hasPermission = hasPermission;
        this.loginUserResponse = loginUserResponse;
    }

    public ApiAuthResponse(String code, Boolean hasPermission) {
        this.code = code;
        this.hasPermission = hasPermission;
    }

    public ApiAuthResponse(Boolean hasPermission) {
        this.hasPermission = hasPermission;
    }

    public ApiAuthResponse(boolean hasPermission, String msg) {
        this.hasPermission = hasPermission;
        this.msg = msg;
    }

    public static ApiAuthResponse success() {
        return new ApiAuthResponse(BizErrorCode.OK.getCode(), true);
    }

    public static ApiAuthResponse success(LoginUserResponse loginUserResponse) {
        return new ApiAuthResponse(BizErrorCode.OK.getCode(), true, loginUserResponse);
    }

    public static ApiAuthResponse fail(String msg) {
        return new ApiAuthResponse(BizErrorCode.USER_ERROR.getCode(), false, msg);
    }
}
