package com.kt.cloud.iam.auth.core.check;


import com.kt.cloud.iam.api.user.permission.request.AuthRequest;
import com.kt.cloud.iam.api.user.permission.response.AuthResponse;

/**
 * 权限校验接口
 */
public interface AuthCheck {

    AuthResponse checkPermission(AuthRequest authRequest);
}
