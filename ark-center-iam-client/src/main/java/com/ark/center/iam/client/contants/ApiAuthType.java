package com.ark.center.iam.client.contants;

import com.baomidou.mybatisplus.annotation.EnumValue;
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

    ANONYMOUS("ANONYMOUS", "无需认证授权"),
    AUTHENTICATION("AUTHENTICATION", "需要认证"),
    AUTHORIZATION("AUTHORIZATION", "需要授权");

    @EnumValue
    private final String value;
    private final String desc;

}