package com.ark.center.iam.application.application;

import com.ark.center.iam.client.application.command.ApplicationCommand;
import com.ark.center.iam.domain.application.Application;
import com.ark.center.iam.domain.application.gateway.ApplicationGateway;
import com.ark.center.iam.domain.application.service.ApplicationCheckService;
import com.ark.center.iam.infra.application.assembler.ApplicationAssembler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ApplicationCommandHandler {

    private final ApplicationGateway applicationGateway;

    private final ApplicationAssembler applicationAssembler;

    private final ApplicationCheckService applicationCheckService;

    public void createApplication(ApplicationCommand dto) {

        Application application = applicationAssembler.toDomain(dto);

        baseCheck(dto);

        applicationGateway.insert(application);
    }

    public void updateApplication(ApplicationCommand dto) {

        baseCheck(dto);

        Application application = applicationAssembler.toDomain(dto);

        applicationGateway.update(application);
    }


    private void baseCheck(ApplicationCommand cmd) {

        applicationCheckService.ensureNameNotExists(cmd.getName(), cmd.getId());

        applicationCheckService.ensureCodeNotExists(cmd.getCode(), cmd.getId());
    }

}
