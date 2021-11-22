package com.kt.cloud.iam.security.model;

import lombok.Data;

@Data
public class SecurityLoginRequest {

    private String username;
    private String password;

}
