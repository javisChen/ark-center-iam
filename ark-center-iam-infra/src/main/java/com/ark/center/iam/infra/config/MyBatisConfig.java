package com.ark.center.iam.infra.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@MapperScan(basePackages = {"com.ark.center.iam.infra.*.repository.db", "com.ark.center.iam.infra.relation.db"})
@Configuration
public class MyBatisConfig {

}
