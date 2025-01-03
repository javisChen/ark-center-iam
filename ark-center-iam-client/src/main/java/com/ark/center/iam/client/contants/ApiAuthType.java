package com.ark.center.iam.client.contants;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@Schema(
    enumAsRef = true,
    description = """
        API认证授权类型:
         * `ANONYMOUS` - 无需认证授权
         * `AUTHENTICATION_REQUIRED` - 需要认证
         * `AUTHORIZATION_REQUIRED` - 需要授权
        """
)
public enum ApiAuthType {

    ANONYMOUS(1, "无需认证授权"),
    AUTHENTICATION_REQUIRED(2, "需要认证"),
    AUTHORIZATION_REQUIRED(3, "需要授权");

    private final int value;
    private final String desc;

}