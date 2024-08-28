package com.ark.center.iam.infra.permission.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum PermissionStatusEnums {

    ENABLED(1, "已启用"),
    DISABLED(2, "已禁用");

    private final int value;
    private final String desc;

}