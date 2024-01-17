package com.ark.center.iam.infra.application.gateway.impl;

import com.ark.center.iam.client.application.dto.ApplicationDTO;
import com.ark.center.iam.client.application.query.ApplicationQry;
import com.ark.center.iam.domain.application.Application;
import com.ark.center.iam.domain.application.gateway.ApplicationGateway;
import com.ark.center.iam.infra.application.assembler.ApplicationConverter;
import com.ark.center.iam.infra.application.gateway.db.ApplicationDO;
import com.ark.center.iam.infra.application.gateway.db.ApplicationMapper;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class ApplicationGatewayImpl implements ApplicationGateway {

    private final ApplicationConverter converter;

    private final ApplicationMapper mapper;

    @Override
    public List<ApplicationDTO> selectApplications(ApplicationQry dto) {
        return mapper.selectList(Wrappers.lambdaQuery(ApplicationDO.class))
                .stream()
                .map(converter::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    public void save(Application application) {
        ApplicationDO db = converter.fromDomain(application);
        mapper.insert(db);
    }

    @Override
    public void update(Application application) {
        ApplicationDO db = converter.fromDomain(application);
        mapper.updateById(db);
    }

    @Override
    public Application selectByCode(String code) {
        LambdaQueryWrapper<ApplicationDO> qw = Wrappers.lambdaQuery(ApplicationDO.class)
                .eq(ApplicationDO::getCode, code)
                .eq(ApplicationDO::getIsDeleted, DeletedEnums.NOT.getCode());
        ApplicationDO applicationDO = mapper.selectOne(qw);
        return converter.toDomain(applicationDO);
    }

    @Override
    public Application selectByName(String name) {
        LambdaQueryWrapper<ApplicationDO> qw = Wrappers.lambdaQuery(ApplicationDO.class)
                .eq(ApplicationDO::getName, name)
                .eq(ApplicationDO::getIsDeleted, DeletedEnums.NOT.getCode());
        ApplicationDO applicationDO = mapper.selectOne(qw);
        return converter.toDomain(applicationDO);
    }

    @Override
    public Application queryById(Long applicationId) {
        ApplicationDO db = mapper.selectById(applicationId);
        return converter.toDomain(db);
    }
}
