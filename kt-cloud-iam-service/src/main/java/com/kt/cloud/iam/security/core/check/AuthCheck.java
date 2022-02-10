package com.kt.cloud.iam.security.core.check;


import com.kt.cloud.iam.api.user.permission.request.ApiAuthRequest;
import com.kt.cloud.iam.api.user.permission.response.ApiAuthResponse;

/**
 * 权限校验接口
 */
public interface AuthCheck {

    ApiAuthResponse checkPermission(ApiAuthRequest authRequest);
}
