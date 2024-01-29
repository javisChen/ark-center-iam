package com.ark.center.iam.infra.application.gateway.impl;

import com.ark.center.iam.domain.application.Application;
import com.ark.center.iam.domain.application.gateway.ApplicationRepository;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class ApplicationDBRepository extends BaseDBRepository<Application, Long> implements ApplicationRepository {

    @Override
    public Application queryByName(String name) {
        return lambdaQuery()
                .eq(Application::getName, name)
                .one();
    }

    @Override
    public Application queryByCode(String code) {
        return lambdaQuery()
                .eq(Application::getCode, code)
                .one();
    }
}
