package com.kt.cloud.iam.api.user.permission.response;

import lombok.Data;

/**
 * 登录信息信息
 */
@Data
public class LoginUserResponse {

    private Long userId;
    private String userCode;
    private String username;
    private String accessToken;
    private Long expires;
    private Boolean isSuperAdmin;

}
