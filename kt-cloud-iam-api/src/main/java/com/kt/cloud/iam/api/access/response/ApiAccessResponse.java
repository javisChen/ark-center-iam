package com.kt.cloud.iam.api.access.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
public class ApiAccessResponse {

    private String code;
    private Boolean hasPermission;
    private UserResponse userResponse;
    private String msg;

    public ApiAccessResponse(String code, Boolean hasPermission, String msg) {
        this.code = code;
        this.hasPermission = hasPermission;
        this.msg = msg;
    }

    public ApiAccessResponse(String code, Boolean hasPermission, UserResponse userResponse) {
        this.code = code;
        this.hasPermission = hasPermission;
        this.userResponse = userResponse;
    }

    public ApiAccessResponse(String code, Boolean hasPermission) {
        this.code = code;
        this.hasPermission = hasPermission;
    }

    public ApiAccessResponse(Boolean hasPermission) {
        this.hasPermission = hasPermission;
    }

    public ApiAccessResponse(boolean hasPermission, String msg) {
        this.hasPermission = hasPermission;
        this.msg = msg;
    }

    public static ApiAccessResponse success() {
        return new ApiAccessResponse(ResponseCode.OK.getCode(), true);
    }

    public static ApiAccessResponse success(UserResponse userResponse) {
        return new ApiAccessResponse(ResponseCode.OK.getCode(), true, userResponse);
    }

    public static ApiAccessResponse fail() {
        return new ApiAccessResponse(ResponseCode.USER_ACCESS_DENIED.getCode(), false, ResponseCode.USER_ACCESS_DENIED.getMsg());
    }
    
    @Getter
    @AllArgsConstructor
    public enum ResponseCode {

        OK("000000", "ok"),
        USER_ACCESS_DENIED("A0007", "Authorization failed: access is denied")
        ;

        private final String code;
        private final String msg;

    }
}
