package com.kt.cloud.iam.auth.core.check;

import com.kt.cloud.iam.auth.core.model.AuthRequest;
import com.kt.cloud.iam.auth.core.model.AuthResponse;

/**
 * 权限校验接口
 */
public interface AuthCheck {

    AuthResponse checkPermission(AuthRequest authRequest);
}
