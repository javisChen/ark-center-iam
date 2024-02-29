package com.ark.center.iam.domain.api.service;

import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.ApiRepository;
import com.ark.center.iam.domain.api.event.ApiChangedEvent;
import com.ark.center.iam.domain.api.event.ApiCreatedEvent;
import com.ark.center.iam.domain.api.vo.ApiAuthType;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;

import static cn.hutool.core.lang.Assert.isFalse;

@Service
@RequiredArgsConstructor
public class ApiDomainService {

    private final ApiRepository apiRepository;

    private final ApplicationEventPublisher eventPublisher;

    public Api create(String name,
                      Long appId,
                      Long categoryId,
                      String method,
                      String uri,
                      Integer authType) {

        checkIsDuplicate(appId, method, uri);

        Api api = new Api(name, appId, categoryId, uri, method, ApiAuthType.from(authType));

        api.raiseEvent(new ApiCreatedEvent(this, api.getId()));

        return api;
    }

    public Api update(Api api,
                      String name,
                      Long appId,
                      Long categoryId,
                      String method,
                      String uri,
                      Integer authType) {

        checkIsDuplicate(api.getId(), appId, method, uri);

        api.update(name, appId, categoryId, uri, method, ApiAuthType.from(authType));

        eventPublisher.publishEvent(new ApiChangedEvent(this, api.getId()));

        return api;
    }

    private void checkIsDuplicate(Long appId, String method, String uri) {
        checkIsDuplicate(null, appId, method, uri);
    }

    private void checkIsDuplicate(Long apiId, Long appId, String method, String uri) {
        isFalse(apiRepository.existsByAppIdAndMethodAndUrl(apiId, appId, method, uri),
                ExceptionFactory.userExceptionSupplier("API已存在"));
    }

}

