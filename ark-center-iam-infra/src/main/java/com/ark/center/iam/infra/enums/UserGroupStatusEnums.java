package com.ark.center.iam.infra.enums;

public enum UserGroupStatusEnums {

    ENABLED(1, "已启用"),
    DISABLED(2, "已禁用");

    UserGroupStatusEnums(int value, String desc) {
        this.value = value;
        this.desc = desc;
    }


    private int value;
    private String desc;

    public int getValue() {
        return value;
    }
}