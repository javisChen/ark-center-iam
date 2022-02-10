package com.kt.cloud.iam.common.util;

import com.kt.component.exception.BizException;
import com.kt.cloud.iam.enums.BizEnums;

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
