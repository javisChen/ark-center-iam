package com.ark.center.iam.infra.application.gateway.impl;

import com.ark.center.iam.client.application.dto.ApplicationDTO;
import com.ark.center.iam.client.application.query.ApplicationQry;
import com.ark.center.iam.domain.application.Application;
import com.ark.center.iam.domain.application.gateway.ApplicationGateway;
import com.ark.center.iam.infra.application.assembler.ApplicationAssembler;
import com.ark.center.iam.infra.application.gateway.db.ApplicationMapper;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class ApplicationGatewayImpl extends ServiceImpl<ApplicationMapper, Application> implements ApplicationGateway {

    private final ApplicationAssembler applicationAssembler;

    @Override
    public List<ApplicationDTO> selectApplications(ApplicationQry dto) {
        return this.list()
                .stream()
                .map(applicationAssembler::toApplicationDTO)
                .collect(Collectors.toList());
    }

    @Override
    public void insert(Application application) {
        this.save(application);
    }

    @Override
    public void update(Application application) {
        updateById(application);
    }

    @Override
    public Application selectByCode(String code) {
        return lambdaQuery()
                .eq(Application::getCode, code)
                .eq(Application::getIsDeleted, DeletedEnums.NOT.getCode())
                .one();
    }

    @Override
    public Application selectByName(String name) {
        return lambdaQuery()
                .eq(Application::getName, name)
                .eq(Application::getIsDeleted, DeletedEnums.NOT.getCode())
                .one();
    }

    @Override
    public Application selectById(Long applicationId) {
        return getById(applicationId);
    }
}
