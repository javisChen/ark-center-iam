package com.ark.center.iam.infra.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum UserStatusEnums {

    ENABLED(1, "已启用"),
    DISABLED(2, "已禁用");

    private final int value;
    private final String desc;

    public int getValue() {
        return value;
    }
}