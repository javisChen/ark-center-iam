package com.ark.center.iam.domain.application;

import cn.hutool.core.lang.Assert;
import com.ark.center.iam.domain.application.gateway.ApplicationRepository;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 角色校验服务
 */
@Service
@RequiredArgsConstructor
public class ApplicationChecker {

    private final ApplicationRepository applicationRepository;

    public void ensureNameNotExists(String name) {
        Application application = applicationRepository.queryByName(name);
        Assert.isNull(application, ExceptionFactory.userExceptionSupplier("应用名称已存在"));
    }

    public void ensureCodeNotExists(String code) {
        Application application = applicationRepository.queryByCode(code);
        Assert.isNull(application, ExceptionFactory.userExceptionSupplier("应用编码已存在"));
    }

    public void ensureNameNotExists(Long appId, String name) {
        Application application = applicationRepository.queryByName(name);
        Assert.isTrue(application == null || !application.getId().equals(appId),
                ExceptionFactory.userExceptionSupplier("应用名称已存在"));
    }
    public void ensureCodeNotExists(Long appId, String code) {
        Application application = applicationRepository.queryByCode(code);
        Assert.isTrue(application == null || !application.getId().equals(appId),
                ExceptionFactory.userExceptionSupplier("应用编码已存在"));
    }
}
