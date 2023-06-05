package com.ark.center.iam;

import lombok.Data;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "user")
@Data
public class UserProperties implements InitializingBean {

    private String value;

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public void afterPropertiesSet() {
        System.out.println(value);
    }
}
