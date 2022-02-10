package com.kt.cloud.iam.config;

import com.kt.cloud.iam.security.core.token.generate.UUIDUserTokenGenerator;
import com.kt.cloud.iam.security.core.token.generate.UserTokenGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BeanConfig {

    @Bean
    public UserTokenGenerator userTokenGenerator() {
        return new UUIDUserTokenGenerator();
    }

}
