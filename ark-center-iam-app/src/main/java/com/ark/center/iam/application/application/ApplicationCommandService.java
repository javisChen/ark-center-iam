package com.ark.center.iam.application.application;

import cn.hutool.core.lang.Assert;
import com.ark.center.iam.client.application.command.ApplicationCreateCommand;
import com.ark.center.iam.client.application.command.ApplicationUpdateCommand;
import com.ark.center.iam.domain.application.*;
import com.ark.center.iam.domain.application.event.ApplicationCreatedEvent;
import com.ark.center.iam.domain.application.gateway.ApplicationGateway;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ApplicationCommandService {

    private final ApplicationGateway applicationGateway;
    private final ApplicationDomainService applicationDomainService;

    @Transactional(rollbackFor = Throwable.class)
    public void handleCreate(ApplicationCreateCommand dto) {

        Application application = applicationDomainService.create(dto.getName(), dto.getCode(), dto.getType());

        applicationGateway.save(application);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void handleUpdate(ApplicationUpdateCommand dto) {
        
        Application application = applicationGateway.queryById(dto.getId());
        
        Assert.notNull(application, ExceptionFactory.userExceptionSupplier("应用不存在"));

        applicationDomainService.update(application, dto.getName());

        applicationGateway.save(application);

    }

}
