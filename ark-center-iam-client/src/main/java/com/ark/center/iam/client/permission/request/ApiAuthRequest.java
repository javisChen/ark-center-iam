package com.ark.center.iam.client.permission.request;

import lombok.Data;

/**
 *
 */
@Data
public class ApiAuthRequest {

    private String accessToken;
    private Long userId;
    private String userCode;
    private String requestUri;
    private String method;
    private String applicationCode;

}
