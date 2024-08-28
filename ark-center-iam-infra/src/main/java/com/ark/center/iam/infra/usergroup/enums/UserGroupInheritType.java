package com.ark.center.iam.infra.usergroup.enums;


import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum UserGroupInheritType {

    NO_INHERIT(0, "不继承"),
    INHERIT_PARENT(1, "继承上级用户组"),
    INHERIT_ALL(2, "继承所有用户组");


    private final int value;
    private final String desc;

}