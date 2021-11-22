package com.kt.cloud.iam.enums;

public enum ApiStatusEnums {

    ENABLED(1, "已启用"),
    DISABLED(2, "已禁用");

    ApiStatusEnums(int value, String desc) {
        this.value = value;
        this.desc = desc;
    }


    private int value;
    private String desc;

    public int getValue() {
        return value;
    }
}