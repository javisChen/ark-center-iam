package com.ark.center.iam.infra.security.configuration;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;

/**
 * 安全配置
 *
 * @author Javis
 */
@ConfigurationProperties(prefix = "ark.security")
@Data
@Configuration
public class SecurityCoreProperties {

    /**
     * 放行名单
     */
    private List<String> allowList = new ArrayList<>();

    /**
     * 禁止名单
     */
    private List<String> blockList = new ArrayList<>();
}
