package com.ark.center.iam.infra.exception;

import com.ark.component.exception.handler.GlobalExceptionHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class IamGlobalExceptionHandler extends GlobalExceptionHandler {
    private static final Logger log = LoggerFactory.getLogger(IamGlobalExceptionHandler.class);

    public IamGlobalExceptionHandler() {
    }

}
