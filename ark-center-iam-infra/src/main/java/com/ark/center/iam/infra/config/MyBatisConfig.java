package com.ark.center.iam.infra.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@MapperScan(basePackages = {
        "com.ark.center.iam.infra.*.gateway.db",
        "com.ark.center.iam.infra.*.db"
})
@Configuration
public class MyBatisConfig {

}
