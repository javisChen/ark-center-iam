package com.kt.cloud.iam.security.core.token.cache;

import com.kt.cloud.iam.api.user.permission.response.LoginUserContext;

/**
 * 用户Token缓存
 */
public interface IUserTokenCacheService {

    UserCacheInfo save(com.kt.component.context.LoginUserContext value);

    void remove(String accessToken);

    void remove(Long userId);

    LoginUserContext get(String accessToken);

}
