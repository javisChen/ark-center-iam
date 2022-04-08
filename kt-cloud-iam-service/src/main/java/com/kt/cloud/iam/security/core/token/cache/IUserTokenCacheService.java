package com.kt.cloud.iam.security.core.token.cache;

import com.kt.cloud.iam.api.user.permission.response.LoginUserResponse;

/**
 * 用户Token缓存
 */
public interface IUserTokenCacheService {

    UserCacheInfo save(LoginUserResponse value);

    void remove(String accessToken);

    void remove(Long userId);

    LoginUserResponse get(String accessToken);

}
