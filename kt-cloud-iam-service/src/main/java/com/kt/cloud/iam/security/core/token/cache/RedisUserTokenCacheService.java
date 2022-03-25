package com.kt.cloud.iam.security.core.token.cache;

import com.kt.cloud.iam.security.core.token.generate.UserTokenGenerator;
import com.kt.component.cache.ICacheService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * RedisToken管理器
 */
@Slf4j
@Component
public class RedisUserTokenCacheService extends AbstractUserTokenCacheService {

    private final ICacheService cacheService;

    public RedisUserTokenCacheService(UserTokenGenerator userTokenGenerator, ICacheService cacheService) {
        super(userTokenGenerator);
        this.cacheService = cacheService;
    }


    @Override
    void saveCache(String key, Object value, long expires) {
        cacheService.set(key, value, expires);
    }

    @Override
    Object getCache(String key) {
        return cacheService.get(key);
    }

    @Override
    void removeCache(String key) {
        cacheService.remove(key);
    }

}
