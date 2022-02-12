package com.kt.cloud.iam;

import com.kt.component.web.config.CloudAppConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@ComponentScan(
        basePackages = {
                "com.kt.cloud.iam.**"
        })
@SpringBootApplication
@EnableFeignClients
@EnableDiscoveryClient
@EnableScheduling
public class Application extends CloudAppConfig {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}