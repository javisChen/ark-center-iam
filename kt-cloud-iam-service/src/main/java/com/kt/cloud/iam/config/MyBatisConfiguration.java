package com.kt.cloud.iam.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@MapperScan(basePackages = "com.kt.cloud.iam.dao.mapper")
@Configuration
public class MyBatisConfiguration {
}
