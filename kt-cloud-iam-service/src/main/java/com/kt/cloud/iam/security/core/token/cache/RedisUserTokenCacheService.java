package com.kt.cloud.iam.security.core.token.cache;

import com.kt.cloud.iam.security.core.token.generate.UserTokenGenerator;
import com.kt.component.cache.redis.RedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * RedisToken管理器
 */
@Slf4j
@Component
public class RedisUserTokenCacheService extends AbstractUserTokenCacheService {

    @Autowired
    private RedisService redisService;

    public RedisUserTokenCacheService(UserTokenGenerator userTokenGenerator) {
        super(userTokenGenerator);
    }


    @Override
    void saveCache(String key, Object value, long expires) {
        redisService.set(key, value, expires);
    }

    @Override
    Object getCache(String key) {
        return redisService.get(key);
    }

    @Override
    void removeCache(String key) {
        redisService.remove(key);
    }

}
