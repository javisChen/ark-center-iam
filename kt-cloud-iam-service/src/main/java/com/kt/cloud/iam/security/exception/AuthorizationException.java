package com.kt.cloud.iam.security.exception;

import com.kt.component.exception.BizException;

/**
 * 认证异常类
 * @author jc
 */
public class AuthorizationException extends BizException {

    public AuthorizationException(String errMessage) {
        super(errMessage);
    }

    public AuthorizationException(String errCode, String errMessage) {
        super(errCode, errMessage);
    }

    public AuthorizationException(String errMessage, Throwable e) {
        super(errMessage, e);
    }

    public AuthorizationException(String errorCode, String errMessage, Throwable e) {
        super(errorCode, errMessage, e);
    }

    public static AuthorizationException of(String errCode, String errMessage) {
        return new AuthorizationException(errCode, errMessage);
    }
}
