package com.kt.cloud.iam.exception;

import com.kt.cloud.iam.security.exception.AuthenticationException;
import com.kt.cloud.iam.security.exception.AuthorizationException;
import com.kt.component.dto.ServerResponse;
import com.kt.component.exception.handler.GlobalExceptionHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class IamExceptionHandler extends GlobalExceptionHandler {
    private static final Logger log = LoggerFactory.getLogger(IamExceptionHandler.class);

    public IamExceptionHandler() {
    }

    @ExceptionHandler({AuthenticationException.class})
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public ServerResponse handle(AuthenticationException e) {
        log.error("AuthenticationException：", e);
        return ServerResponse.error(e.getErrCode(), e.getMessage());
    }

    @ExceptionHandler({AuthorizationException.class})
    @ResponseStatus(HttpStatus.FORBIDDEN)
    public ServerResponse handle(AuthorizationException e) {
        log.error("AuthorizationException：", e);
        return ServerResponse.error(e.getErrCode(), e.getMessage());
    }
}
