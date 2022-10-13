package com.ark.center.iam.config;

import com.ark.center.iam.security.core.token.generate.UUIDUserTokenGenerator;
import com.ark.center.iam.security.core.token.generate.UserTokenGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class BeanConfig {

    @Bean
    public UserTokenGenerator userTokenGenerator() {
        return new UUIDUserTokenGenerator();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


}