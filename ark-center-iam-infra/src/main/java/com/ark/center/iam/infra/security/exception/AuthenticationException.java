package com.ark.center.iam.infra.security.exception;

import com.ark.component.exception.UserException;

/**
 * 授权异常类
 * @author jc
 */
public class AuthenticationException extends UserException {

    public AuthenticationException(String errMessage) {
        super(errMessage);
    }

    public AuthenticationException(String errCode, String errMessage) {
        super(errCode, errMessage);
    }

    public AuthenticationException(String errMessage, Throwable e) {
        super(errMessage, e);
    }


    public static AuthenticationException of(String errMessage) {
        return new AuthenticationException(errMessage);
    }
}
