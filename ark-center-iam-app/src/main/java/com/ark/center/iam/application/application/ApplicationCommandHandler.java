package com.ark.center.iam.application.application;

import cn.hutool.core.lang.Assert;
import com.ark.center.iam.client.application.command.ApplicationCreateCommand;
import com.ark.center.iam.client.application.command.ApplicationUpdateCommand;
import com.ark.center.iam.domain.application.*;
import com.ark.center.iam.domain.application.gateway.ApplicationRepository;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ApplicationCommandHandler {

    private final ApplicationRepository applicationRepository;
    private final ApplicationDomainService applicationDomainService;

    @Transactional(rollbackFor = Throwable.class)
    public void handleCreate(ApplicationCreateCommand dto) {

        Application application = applicationDomainService.create(dto.getName(), dto.getCode(), dto.getType());

        applicationRepository.persist(application);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void handleUpdate(ApplicationUpdateCommand dto) {
        
        Application application = applicationRepository.byId(dto.getId());
        
        Assert.notNull(application, ExceptionFactory.userExceptionSupplier("应用不存在"));

        applicationDomainService.update(application, dto.getName());

        applicationRepository.persist(application);

    }

}
