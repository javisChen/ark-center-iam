package com.ark.center.iam.application.application;

import com.ark.center.iam.client.application.command.ApplicationCmd;
import com.ark.center.iam.client.application.dto.ApplicationDTO;
import com.ark.center.iam.client.application.query.ApplicationQry;
import com.ark.center.iam.domain.application.Application;
import com.ark.center.iam.domain.application.gateway.ApplicationGateway;
import com.ark.center.iam.domain.application.service.ApplicationCheckService;
import com.ark.center.iam.infra.application.assembler.ApplicationAssembler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApplicationAppService {

    private final ApplicationGateway applicationGateway;

    private final ApplicationAssembler applicationAssembler;

    private final ApplicationCheckService applicationCheckService;

    private final ApplicationCreateCmdExe applicationCreateCmdExe;

    public List<ApplicationDTO> queryList(ApplicationQry dto) {
        return applicationGateway.selectApplications(dto);
    }

    public void createApplication(ApplicationCmd dto) {

        Application application = applicationAssembler.toDomain(dto);

        baseCheck(dto);

        applicationGateway.insert(application);
    }

    public void updateApplication(ApplicationCmd dto) {

        baseCheck(dto);

        Application application = applicationAssembler.toDomain(dto);

        applicationGateway.update(application);
    }


    private void baseCheck(ApplicationCmd cmd) {

        applicationCheckService.ensureNameNotExists(cmd.getName(), cmd.getId());

        applicationCheckService.ensureCodeNotExists(cmd.getCode(), cmd.getId());
    }

    private boolean sameRecord(ApplicationCmd cmd, Application application) {
        return cmd.getId() != null && cmd.getId().equals(application.getId());
    }

}
