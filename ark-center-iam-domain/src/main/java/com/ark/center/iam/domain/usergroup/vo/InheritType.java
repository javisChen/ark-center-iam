package com.ark.center.iam.domain.usergroup.vo;


import com.ark.component.ddd.domain.util.EnumUtils;
import com.ark.component.ddd.domain.vo.BaseEnum;
import lombok.AllArgsConstructor;

@AllArgsConstructor
public enum InheritType implements BaseEnum {

    NO_INHERIT(0, "不继承"),
    INHERIT_PARENT(1, "继承上级用户组"),
    INHERIT_ALL(2, "继承所有用户组");

    private final int value;
    private final String desc;

    public static InheritType from(Integer inheritType) {
        return EnumUtils.getByValue(values(), inheritType);
    }

    @Override
    public Integer getValue() {
        return this.value;
    }
}