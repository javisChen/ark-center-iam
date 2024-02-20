package com.ark.center.iam.domain.api.vo;

import com.ark.component.ddd.domain.util.EnumUtils;
import com.ark.component.ddd.domain.vo.BaseEnum;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public enum ApiAuthType implements BaseEnum {

    NONE(1, "无需认证授权"),
    AUTHENTICATION(2, "只需认证无需授权"),
    AUTHENTICATION_AUTHORIZATION(3, "需要认证和授权");

    private final Integer value;
    private final String desc;

    public static ApiAuthType from(int value) {
        return EnumUtils.getByValue(values(), value);
    }

}