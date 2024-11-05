package com.ark.center.iam.infra.application.service;

import com.ark.center.iam.client.application.dto.ApplicationDTO;
import com.ark.center.iam.client.application.query.ApplicationQuery;
import com.ark.center.iam.infra.application.Application;
import com.ark.center.iam.infra.application.gateway.ApplicationGateway;
import com.ark.center.iam.infra.application.assembler.ApplicationAssembler;
import com.ark.center.iam.infra.application.db.ApplicationMapper;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class ApplicationService extends ServiceImpl<ApplicationMapper, Application> {

    private final ApplicationAssembler applicationAssembler;

    public List<ApplicationDTO> selectApplications(ApplicationQuery dto) {
        return this.list()
                .stream()
                .map(applicationAssembler::toApplicationDTO)
                .collect(Collectors.toList());
    }

    public void insert(Application application) {
        this.save(application);
    }

    public void update(Application application) {
        updateById(application);
    }

    public Application selectByCode(String code) {
        return lambdaQuery()
                .eq(Application::getCode, code)
                .eq(Application::getIsDeleted, DeletedEnums.NOT.getCode())
                .one();
    }

    public Application selectByName(String name) {
        return lambdaQuery()
                .eq(Application::getName, name)
                .eq(Application::getIsDeleted, DeletedEnums.NOT.getCode())
                .one();
    }

    public Application queryById(Long applicationId) {
        return getById(applicationId);
    }
}
