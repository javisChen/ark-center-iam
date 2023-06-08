package com.ark.center.iam.application.application;

import cn.hutool.core.lang.Assert;
import com.ark.center.iam.client.application.command.ApplicationCmd;
import com.ark.center.iam.client.application.dto.ApplicationDTO;
import com.ark.center.iam.client.application.query.ApplicationQry;
import com.ark.center.iam.domain.application.gateway.ApplicationGateway;
import com.ark.center.iam.infra.application.gateway.db.Application;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApplicationAppService {

    private final ApplicationGateway applicationGateway;


    public List<ApplicationDTO> queryList(ApplicationQry dto) {
        return applicationGateway.selectApplications(dto);
    }

    public void createApplication(ApplicationCmd dto) {

    }

    public void updateApplication(ApplicationCmd dto) {

    }


    private void checkBeforeSave(ApplicationCmd dto) {
        Application application = getApplicationByName(dto.getName());
        Assert.isTrue(application != null, BizEnums.APPLICATION_NAME_ALREADY_EXISTS);
        application = getApplicationByCode(dto.getCode());
        Assert.isTrue(application != null, BizEnums.APPLICATION_CODE_ALREADY_EXISTS);
    }

    private IamApplication getApplicationByName(String name) {
        LambdaQueryWrapper<IamApplication> qw = new LambdaQueryWrapper<>();
        qw.eq(IamApplication::getName, name);
        return this.getOne(qw);
    }
}
