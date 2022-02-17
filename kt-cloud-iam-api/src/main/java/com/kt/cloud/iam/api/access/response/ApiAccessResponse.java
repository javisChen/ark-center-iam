package com.kt.cloud.iam.api.access.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Builder
public class ApiAccessResponse {

    private Boolean hasPermission;
    private UserResponse userResponse;

    public static ApiAccessResponse success() {
        return ApiAccessResponse.builder()
                .hasPermission(true)
                .build();
    }

    public static ApiAccessResponse success(UserResponse userResponse) {
        return ApiAccessResponse.builder()
                .userResponse(userResponse)
                .hasPermission(true)
                .build();
    }

    public static ApiAccessResponse fail() {
        return ApiAccessResponse.builder()
                .hasPermission(false)
                .build();
    }

    public static ApiAccessResponse fail(String code, String msg) {
        return ApiAccessResponse.builder()
                .hasPermission(false)
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
