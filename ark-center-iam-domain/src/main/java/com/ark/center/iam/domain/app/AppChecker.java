package com.ark.center.iam.domain.app;

import cn.hutool.core.lang.Assert;
import com.ark.center.iam.domain.app.gateway.AppRepository;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 角色校验服务
 */
@Service
@RequiredArgsConstructor
public class AppChecker {

    private final AppRepository appRepository;

    public void ensureNameNotExists(String name) {
        Assert.isFalse(appRepository.existsByName(name),
                ExceptionFactory.userExceptionSupplier("应用名称已存在"));
    }

    public void ensureCodeNotExists(String code) {
        Assert.isFalse(appRepository.existsByCode(code),
                ExceptionFactory.userExceptionSupplier("应用编码已存在"));
    }

    public void ensureNameNotExists(Long appId, String name) {
        Assert.isFalse(appRepository.existsByName(appId, name),
                ExceptionFactory.userExceptionSupplier("应用名称已存在"));
    }
    public void ensureCodeNotExists(Long appId, String code) {
        Assert.isFalse(appRepository.existsByCode(appId, code),
                ExceptionFactory.userExceptionSupplier("应用编码已存在"));
    }

}
