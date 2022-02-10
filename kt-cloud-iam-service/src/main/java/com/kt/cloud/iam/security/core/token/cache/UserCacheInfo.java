package com.kt.cloud.iam.security.core.token.cache;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserCacheInfo {

    private String accessToken;
    private Integer expires;
}
