package com.ark.center.iam.config;

import com.ark.center.iam.security.core.token.generate.JwtUserTokenGenerator;
import com.ark.center.iam.security.core.token.generate.UUIDUserTokenGenerator;
import com.ark.center.iam.security.core.token.generate.UserTokenGenerator;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class BeanConfig {

    @Bean
    @ConditionalOnMissingBean
    public UserTokenGenerator userTokenGenerator() {
        return new JwtUserTokenGenerator();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


}
