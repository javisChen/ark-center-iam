package com.ark.center.iam.application.application;

import com.ark.center.iam.client.application.command.ApplicationCommand;
import com.ark.center.iam.infra.application.Application;
import com.ark.center.iam.infra.application.gateway.ApplicationGateway;
import com.ark.center.iam.infra.application.assembler.ApplicationAssembler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ApplicationCreateCmdExe {

    private final ApplicationGateway applicationGateway;

    private final ApplicationAssembler applicationAssembler;

    public void execute(ApplicationCommand cmd) {

        Application application = applicationGateway.queryById(cmd.getId());
        if (application == null) {
            application = applicationAssembler.toDomain(cmd);
        }

//        baseCheck(cmd);
//
//        applicationGateway.insert(application);

    }
}
