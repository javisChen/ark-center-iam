package com.ark.center.iam.infra.api.repository;

import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.ApiRepository;
import com.ark.center.iam.infra.api.converter.ApiDomainConverter;
import com.ark.center.iam.infra.api.repository.db.ApiDAO;
import com.ark.center.iam.infra.api.repository.db.ApiDO;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import com.ark.component.orm.mybatis.base.BaseEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ApiDBRepositoryImpl extends BaseDBRepository<Api, Long> implements ApiRepository {

    private final ApiDAO dao;
    private final ApiDomainConverter domainConverter;

    @Override
    public boolean existsByAppIdAndMethodAndUrl(Long excludeId, Long applicationId, String method, String url) {
        return dao.lambdaQuery()
                .ne(excludeId != null, BaseEntity::getId, excludeId)
                .eq(ApiDO::getUri, url)
                .eq(ApiDO::getMethod, method)
                .eq(ApiDO::getApplicationId, applicationId)
                .exists();
    }

    @Override
    public List<Api> byAppId(Long applicationId) {
        List<ApiDO> doList = dao.lambdaQuery()
                .eq(ApiDO::getApplicationId, applicationId)
                .list();
        return domainConverter.fromDomain(doList);
    }

    @Override
    public Api byId(Long id) {
        ApiDO apiDO = dao.getById(id);
        return domainConverter.toDomain(apiDO);
    }

    @Override
    public void save(Api api) {
        ApiDO apiDO = domainConverter.fromDomain(api);
        dao.saveOrUpdate(apiDO);
    }

    @Override
    public void delete(Api ar) {
        dao.removeById(ar.getId());
    }

    @Override
    public void delete(List<Long> ids) {
        dao.removeByIds(ids);
    }
}
