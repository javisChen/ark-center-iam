package com.ark.center.iam.domain.application;

import com.ark.component.ddd.domain.util.EnumUtils;
import com.ark.component.ddd.domain.vo.BaseEnum;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum ApplicationType implements BaseEnum {

    SYSTEM(1, "业务系统（前后端）"),
    BACKEND_SERVICE(2, "纯后台服务");

    private final Integer value;
    private final String desc;

    public static ApplicationType from(Integer value) {
        return EnumUtils.getByValue(values(), value);
    }

}