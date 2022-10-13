package com.ark.center.iam.common.util;

import com.ark.component.exception.BizException;
import com.ark.center.iam.enums.BizEnums;

public class Assert {

    public static void isTrue(boolean condition, BizEnums bizEnum) {
        isTrue(condition, new BizException(bizEnum.getCode(), bizEnum.getMsg()));
    }

    public static void isTrue(boolean condition, BizException bizException) {
        if (condition) {
            throw bizException;
        }
    }

    public static void isFalse(boolean condition, BizEnums bizEnum) {
        isTrue(!condition, bizEnum);
    }

}
