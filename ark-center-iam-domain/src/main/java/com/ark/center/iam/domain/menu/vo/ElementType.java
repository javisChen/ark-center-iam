package com.ark.center.iam.domain.menu.vo;

import com.ark.component.ddd.domain.util.EnumUtils;
import com.ark.component.ddd.domain.vo.BaseEnum;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum ElementType implements BaseEnum {

    MENU(1, "BUTTON"),
    PAGE(2, "DIV")
    ;

    private final int value;
    private final String desc;

    public static ElementType from(int value) {
        return EnumUtils.getByValue(values(), value);
    }

}