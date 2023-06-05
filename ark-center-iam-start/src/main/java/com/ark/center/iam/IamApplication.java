package com.ark.center.iam;

import com.ark.component.web.config.ArkWebConfig;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication(scanBasePackages = {"com.ark.center.iam"})
@EnableFeignClients
@EnableDiscoveryClient
public class IamApplication extends ArkWebConfig {

    public static void main(String[] args) {
        SpringApplication.run(IamApplication.class, args);
    }

    @RequestMapping("/u")
    @RequiredArgsConstructor
    public static class Rest {

        private final UserProperties userProperties;

        @GetMapping
        public void t() {
            System.out.println(userProperties.getValue());
        }
    }

}