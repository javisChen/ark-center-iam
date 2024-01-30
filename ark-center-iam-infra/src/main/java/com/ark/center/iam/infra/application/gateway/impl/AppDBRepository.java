package com.ark.center.iam.infra.application.gateway.impl;

import com.ark.center.iam.domain.application.App;
import com.ark.center.iam.domain.application.gateway.AppRepository;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class AppDBRepository extends BaseDBRepository<App, Long> implements AppRepository {

    @Override
    public boolean existsByName(String name) {
        return existsByName(null, name);
    }

    @Override
    public boolean existsByName(Long excludeId, String name) {
        return lambdaQuery()
                .ne(excludeId != null, AggregateRoot::getId, excludeId)
                .eq(App::getName, name)
                .exists();
    }

    @Override
    public boolean existsByCode(String code) {
        return existsByCode(null, code);
    }

    @Override
    public boolean existsByCode(Long excludeId, String code) {
        return lambdaQuery()
                .ne(excludeId != null, AggregateRoot::getId, excludeId)
                .eq(App::getCode, code)
                .exists();
    }
}
