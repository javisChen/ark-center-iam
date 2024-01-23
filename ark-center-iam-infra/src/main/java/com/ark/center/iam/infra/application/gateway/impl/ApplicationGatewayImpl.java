package com.ark.center.iam.infra.application.gateway.impl;

import com.ark.center.iam.domain.application.Application;
import com.ark.center.iam.domain.application.gateway.ApplicationGateway;
import com.ark.center.iam.infra.application.assembler.ApplicationConverter;
import com.ark.center.iam.infra.application.gateway.db.ApplicationDO;
import com.ark.center.iam.infra.application.gateway.db.ApplicationMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import static com.baomidou.mybatisplus.core.toolkit.Wrappers.lambdaQuery;

@Repository
@RequiredArgsConstructor
public class ApplicationGatewayImpl implements ApplicationGateway {

    private final ApplicationConverter converter;

    private final ApplicationMapper mapper;

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
    public Application queryById(Long applicationId) {
        ApplicationDO db = mapper.selectById(applicationId);
        return converter.toDomain(db);
    }

    @Override
    public Application queryByName(String name) {
        LambdaQueryWrapper<ApplicationDO> qw = lambdaQuery(ApplicationDO.class).eq(ApplicationDO::getName, name);
        ApplicationDO db = mapper.selectOne(qw);
        return converter.toDomain(db);
    }

    @Override
    public Application queryByCode(String code) {
        LambdaQueryWrapper<ApplicationDO> qw = lambdaQuery(ApplicationDO.class).eq(ApplicationDO::getCode, code);
        ApplicationDO db = mapper.selectOne(qw);
        return converter.toDomain(db);
    }
}
