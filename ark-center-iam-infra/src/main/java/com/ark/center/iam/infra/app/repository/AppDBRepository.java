package com.ark.center.iam.infra.app.repository;

import com.ark.center.iam.domain.app.App;
import com.ark.center.iam.domain.app.gateway.AppRepository;
import com.ark.center.iam.infra.app.converter.AppDomainConverter;
import com.ark.center.iam.infra.app.repository.db.AppDAO;
import com.ark.center.iam.infra.app.repository.db.AppDO;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class AppDBRepository extends BaseDBRepository<App, Long> implements AppRepository {

    private final AppDAO dao;
    private final AppDomainConverter domainConverter;

    @Override
    public boolean existsByName(String name) {
        return existsByName(null, name);
    }

    @Override
    public boolean existsByName(Long excludeId, String name) {
        return dao.lambdaQuery()
                .ne(excludeId != null, AppDO::getId, excludeId)
                .eq(AppDO::getName, name)
                .exists();
    }

    @Override
    public boolean existsByCode(Long excludeId, String code) {
        return dao.lambdaQuery()
                .ne(excludeId != null, AppDO::getId, excludeId)
                .eq(AppDO::getCode, code)
                .exists();
    }

    @Override
    public boolean existsByCode(String code) {
        return existsByCode(null, code);
    }

    @Override
    public App byId(Long id) {
        AppDO appDO = dao.getById(id);
        return domainConverter.toDomain(appDO);
    }

    @Override
    public void save(App app) {
        AppDO appDO = domainConverter.fromDomain(app);
        dao.saveOrUpdate(appDO);
    }

    @Override
    public void delete(App ar) {
        dao.removeById(ar.getId());
    }

    @Override
    public void delete(List<Long> ids) {
        dao.removeByIds(ids);
    }

}
