package com.ark.center.iam.client.access.response;

import lombok.Data;

/**
 * 登录信息信息
 */
@Data
public class UserResponse {

    private Long userId;
    private String userCode;
    private String username;
    private String accessToken;
    private Long expires;
    private Boolean isSuperAdmin;

}
