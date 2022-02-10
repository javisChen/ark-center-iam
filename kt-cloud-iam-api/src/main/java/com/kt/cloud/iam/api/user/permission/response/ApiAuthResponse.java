package com.kt.cloud.iam.api.user.permission.response;

import com.kt.component.dto.ResponseEnums;
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
    private LoginUserContext loginUserContext;
    private String msg;

    public ApiAuthResponse(String code, Boolean hasPermission, String msg) {
        this.code = code;
        this.hasPermission = hasPermission;
        this.msg = msg;
    }

    public ApiAuthResponse(String code, Boolean hasPermission, LoginUserContext loginUserContext) {
        this.code = code;
        this.hasPermission = hasPermission;
        this.loginUserContext = loginUserContext;
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
        return new ApiAuthResponse(ResponseEnums.OK.getCode(), true);
    }

    public static ApiAuthResponse success(LoginUserContext loginUserContext) {
        return new ApiAuthResponse(ResponseEnums.OK.getCode(), true, loginUserContext);
    }

    public static ApiAuthResponse fail(String msg) {
        return new ApiAuthResponse(ResponseEnums.USER_ACCESS_DENIED.getCode(), false, msg);
    }
}
