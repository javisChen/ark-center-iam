package com.ark.center.iam.application.application;

import cn.hutool.core.lang.Assert;
import com.ark.center.iam.client.application.command.ApplicationCmd;
import com.ark.center.iam.client.application.dto.ApplicationDTO;
import com.ark.center.iam.client.application.query.ApplicationQry;
import com.ark.center.iam.domain.application.Application;
import com.ark.center.iam.domain.application.gateway.ApplicationGateway;
import com.ark.center.iam.infra.application.assembler.ApplicationAssembler;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApplicationAppService {

    private final ApplicationGateway applicationGateway;
    private final ApplicationAssembler applicationAssembler;


    public List<ApplicationDTO> queryList(ApplicationQry dto) {
        return applicationGateway.selectApplications(dto);
    }

    public void createApplication(ApplicationCmd dto) {

        Application application = applicationAssembler.toApplicationDO(dto);

        baseCheck(dto);

        applicationGateway.insert(application);
    }

    public void updateApplication(ApplicationCmd dto) {

        baseCheck(dto);

        Application application = applicationAssembler.toApplicationDO(dto);

        applicationGateway.insert(application);
    }


    private void baseCheck(ApplicationCmd cmd) {
        Application existsApplication = applicationGateway.selectByName(cmd.getName());
        Assert.isTrue(existsApplication != null && sameRecord(cmd, existsApplication),
                () -> ExceptionFactory.userException("应用名称已存在"));
        existsApplication = applicationGateway.selectByCode(cmd.getCode());
        Assert.isTrue(existsApplication != null && sameRecord(cmd, existsApplication), () -> ExceptionFactory.userException("应用编码已存在"));
    }

    private boolean sameRecord(ApplicationCmd cmd, Application application) {
        return cmd.getId() != null && cmd.getId().equals(application.getId());
    }

}
