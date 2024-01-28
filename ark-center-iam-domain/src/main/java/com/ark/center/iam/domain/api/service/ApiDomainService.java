package com.ark.center.iam.domain.api.service;

import cn.hutool.core.lang.Assert;
import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.event.ApiCreatedEvent;
import com.ark.center.iam.domain.api.gateway.ApiGateway;
import com.ark.center.iam.domain.api.vo.ApiAuthType;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ApiDomainService {

    private final ApiGateway apiGateway;
    private final ApplicationEventPublisher eventPublisher;

    public Api create(String name,
                      Long appId,
                      Long categoryId,
                      String method,
                      String url,
                      Integer authType) {

        checkIsDuplicate(appId, method, url);

        Api api = new Api(name, appId, categoryId, url, method, ApiAuthType.from(authType));

        // addPermission(api);

        eventPublisher.publishEvent(new ApiCreatedEvent(this, api.getId()));

        return api;
    }

    private void checkIsDuplicate(Long appId, String method, String uri) {
        checkIsDuplicate(null, appId, method, uri);
    }

    private void checkIsDuplicate(Long apiId, Long appId, String method, String uri) {
        Assert.isFalse(apiGateway.existsByAppIdAndMethodAndUrl(apiId, appId, method, uri),
                ExceptionFactory.userExceptionSupplier("API已存在")
        ;
    }
}

