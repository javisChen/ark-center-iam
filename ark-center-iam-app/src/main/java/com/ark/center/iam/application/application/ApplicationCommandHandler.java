package com.ark.center.iam.application.application;

import com.ark.center.iam.domain.app.App;
import com.ark.center.iam.domain.app.ApplicationDomainService;
import com.ark.center.iam.domain.app.ApplicationFactory;
import com.ark.center.iam.domain.app.gateway.AppRepository;
import com.ark.center.iam.model.application.command.ApplicationCreateCommand;
import com.ark.center.iam.model.application.command.ApplicationUpdateCommand;
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

        appRepository.saveAndPublishEvents(app);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void handleUpdate(ApplicationUpdateCommand command) {
        
        App app = appRepository.byId(command.getId());
        
        applicationDomainService.update(app, command.getName(), command.getCode());

        appRepository.saveAndPublishEvents(app);

    }

}
