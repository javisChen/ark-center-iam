package com.ark.center.iam.domain.user.vo;

import com.ark.component.ddd.domain.util.EnumUtils;
import com.ark.component.ddd.domain.vo.BaseEnum;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum UserType implements BaseEnum {

    C(1, "C端用户"),
    B(2, "B端用户");

    private final Integer value;
    private final String desc;

    public static UserType from(int value) {
        return EnumUtils.getByValue(values(), value);
    }

}
