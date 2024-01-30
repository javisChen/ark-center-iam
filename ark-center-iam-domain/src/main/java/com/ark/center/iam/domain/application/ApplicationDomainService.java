package com.ark.center.iam.domain.application;

import cn.hutool.core.lang.Assert;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ApplicationDomainService {

    private final AppChecker appChecker;

    public void update(App app, String name) {

        Assert.notNull(app, ExceptionFactory.userExceptionSupplier("应用不存在"));

        appChecker.ensureNameNotExists(app.getId(), name);

        appChecker.ensureCodeNotExists(app.getId(), name);

        app.rename(name);

//        eventPublisher.publishEvent(new ApplicationChangedEvent(this, application.getId()));
    }

}