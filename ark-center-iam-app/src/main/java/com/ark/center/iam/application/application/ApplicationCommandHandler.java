package com.ark.center.iam.application.application;

import com.ark.center.iam.client.application.command.ApplicationCreateCommand;
import com.ark.center.iam.client.application.command.ApplicationUpdateCommand;
import com.ark.center.iam.domain.application.App;
import com.ark.center.iam.domain.application.ApplicationDomainService;
import com.ark.center.iam.domain.application.ApplicationFactory;
import com.ark.center.iam.domain.application.gateway.AppRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ApplicationCommandHandler {

    private final AppRepository appRepository;
    private final ApplicationDomainService applicationDomainService;
    private final ApplicationFactory applicationFactory;

    @Transactional(rollbackFor = Throwable.class)
    public void handleCreate(ApplicationCreateCommand command) {

        App app = applicationFactory.create(command.getName(), command.getCode(), command.getType());

        appRepository.persist(app);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void handleUpdate(ApplicationUpdateCommand command) {
        
        App app = appRepository.byId(command.getId());
        
        applicationDomainService.update(app, command.getName());

        appRepository.persist(app);

    }

}
