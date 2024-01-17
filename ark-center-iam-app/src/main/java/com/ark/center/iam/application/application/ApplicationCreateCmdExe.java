package com.ark.center.iam.application.application;

import com.ark.center.iam.client.application.command.ApplicationCmd;
import com.ark.center.iam.domain.application.Application;
import com.ark.center.iam.domain.application.gateway.ApplicationGateway;
import com.ark.center.iam.infra.application.assembler.ApplicationAssembler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ApplicationCreateCmdExe {

    private final ApplicationGateway applicationGateway;

    private final ApplicationAssembler applicationAssembler;

    public void execute(ApplicationCmd cmd) {

        Application application = applicationGateway.queryById(cmd.getId());
        if (application == null) {
            application = applicationAssembler.toDomain(cmd);
        }

//        baseCheck(cmd);
//
//        applicationGateway.insert(application);

    }
}
