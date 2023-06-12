package com.ark.center.iam.infra.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@MapperScan(basePackages = "com.ark.center.iam.dao.mapper")
@Configuration
public class MyBatisConfig {
    
}
