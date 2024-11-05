package com.ark.center.iam.application.application;

import com.ark.center.iam.client.application.command.ApplicationCommand;
import com.ark.center.iam.infra.application.Application;
import com.ark.center.iam.infra.application.service.ApplicationCheckService;
import com.ark.center.iam.infra.application.assembler.ApplicationAssembler;
import com.ark.center.iam.infra.application.service.ApplicationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ApplicationCommandHandler {

    private final ApplicationService applicationService;

    private final ApplicationAssembler applicationAssembler;

    private final ApplicationCheckService applicationCheckService;

    public void createApplication(ApplicationCommand dto) {

        Application application = applicationAssembler.toDomain(dto);

        baseCheck(dto);

        applicationService.save(application);
    }

    public void updateApplication(ApplicationCommand dto) {

        baseCheck(dto);

        Application application = applicationAssembler.toDomain(dto);

        applicationService.update(application);
    }


    private void baseCheck(ApplicationCommand cmd) {

        applicationCheckService.ensureNameNotExists(cmd.getName(), cmd.getId());

        applicationCheckService.ensureCodeNotExists(cmd.getCode(), cmd.getId());
    }

}
