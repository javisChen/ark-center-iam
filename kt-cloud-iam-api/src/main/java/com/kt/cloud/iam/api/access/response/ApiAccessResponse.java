package com.kt.cloud.iam.api.access.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Builder
public class ApiAccessResponse {

//    private String code;
    private Boolean hasPermission;
    private UserResponse userResponse;
//    private String msg;

    public static ApiAccessResponse success() {
        return ApiAccessResponse.builder()
//                .code(ResponseCode.OK.getCode())
                .hasPermission(true)
//                .msg("pass")
                .build();
    }

    public static ApiAccessResponse success(UserResponse userResponse) {
        return ApiAccessResponse.builder()
//                .code(ResponseCode.OK.getCode())
                .userResponse(userResponse)
                .hasPermission(true)
//                .msg("pass")
                .build();
    }

    public static ApiAccessResponse fail() {
        return ApiAccessResponse.builder()
//                .code(ResponseCode.USER_ACCESS_DENIED.getCode())
                .hasPermission(false)
//                .msg(ResponseCode.USER_ACCESS_DENIED.getMsg())
                .build();
    }

    public static ApiAccessResponse fail(String code, String msg) {
        return ApiAccessResponse.builder()
//                .code(code)
                .hasPermission(false)
//                .msg(msg)
                .build();
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
