package com.ark.center.iam.domain.application;

import com.ark.center.iam.domain.application.event.ApplicationChangedEvent;
import com.ark.center.iam.domain.application.event.ApplicationCreatedEvent;
import com.ark.center.iam.domain.application.gateway.ApplicationGateway;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ApplicationDomainService {

    private final ApplicationChecker applicationChecker;
    private final ApplicationFactory applicationFactory;
    private final ApplicationEventPublisher eventPublisher;

    public void update(Application application, String name) {
        applicationChecker.ensureNameNotExists(application.getId(), name);
        application.rename(name);
        eventPublisher.publishEvent(new ApplicationChangedEvent(application.getId()));
    }

    public Application create(String name, String code, Integer type) {
        Application application = applicationFactory.create(name, code, type);
        eventPublisher.publishEvent(new ApplicationCreatedEvent(application.getId()));
        return application;
    }
}