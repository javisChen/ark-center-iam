package com.ark.center.iam.domain.menu.vo;

import com.ark.component.ddd.domain.util.EnumUtils;
import com.ark.component.ddd.domain.vo.BaseEnum;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum MenuType implements BaseEnum {

    MENU(1, "菜单路由"),
    PAGE(2, "页面路由"),
    PAGE_HIDDEN(3, "页面隐藏路由");

    private final Integer value;
    private final String desc;

    public static MenuType from(int value) {
        return EnumUtils.getByValue(values(), value);
    }

}