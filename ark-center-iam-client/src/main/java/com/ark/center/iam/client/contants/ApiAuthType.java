package com.ark.center.iam.client.contants;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public enum ApiAuthType {

    ANONYMOUS(1, "无需认证授权"),
    AUTHENTICATION_REQUIRED(2, "需要认证"),
    AUTHORIZATION_REQUIRED(3, "需要授权");

    private final int value;
    private final String desc;

}