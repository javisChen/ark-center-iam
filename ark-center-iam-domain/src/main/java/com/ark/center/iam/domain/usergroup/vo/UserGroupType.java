package com.ark.center.iam.domain.usergroup.vo;


import com.ark.component.ddd.domain.util.EnumUtils;
import com.ark.component.ddd.domain.vo.BaseEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum UserGroupType implements BaseEnum {

    COMPANY(1, "公司"),
    DEPARTMENT(2, "部门")
    ;

    private final int value;
    private final String desc;

    public static UserGroupType from(Integer type) {
        return EnumUtils.getByValue(values(), type);
    }
}