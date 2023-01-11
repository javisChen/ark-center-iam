package com.ark.center.iam;

import com.ark.component.web.config.ArkWebConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication(scanBasePackages = {"com.ark.center.iam"})
@EnableFeignClients
@EnableDiscoveryClient
public class Application extends ArkWebConfig {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}