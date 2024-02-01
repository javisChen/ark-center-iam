package com.ark.center.iam.infra.apicategory.repository;

import com.ark.center.iam.domain.apicategory.ApiCategory;
import com.ark.center.iam.domain.apicategory.ApiCategoryRepository;
import com.ark.center.iam.infra.apicategory.converter.ApiCategoryDomainConverter;
import com.ark.center.iam.infra.apicategory.repository.db.ApiCategoryDAO;
import com.ark.center.iam.infra.apicategory.repository.db.ApiCategoryDO;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.ark.component.web.common.DeletedEnums;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.baomidou.mybatisplus.extension.toolkit.Db.lambdaQuery;

@Repository
@RequiredArgsConstructor
public class ApiCategoryDBRepository extends BaseDBRepository<ApiCategory, Long> implements ApiCategoryRepository {

    private final ApiCategoryDAO dao;

    private final ApiCategoryDomainConverter domainConverter;

    @Override
    public boolean exists(String name, Long appId) {
        return dao.lambdaQuery()
                .eq(ApiCategoryDO::getIsDeleted, DeletedEnums.NOT.getCode())
                .eq(ApiCategoryDO::getName, name)
                .eq(ApiCategoryDO::getApplicationId, appId)
                .exists();
    }


    @Override
    public List<ApiCategory> byAppId(Long applicationId) {
        List<ApiCategoryDO> categoryDOS = lambdaQuery(ApiCategoryDO.class)
                .eq(ApiCategoryDO::getApplicationId, applicationId)
                .list();
        return domainConverter.convert(categoryDOS);
    }

    @Override
    public boolean existsByNameAndAppId(Long id, String name, Long applicationId) {
        return dao.lambdaQuery()
                .eq(ApiCategoryDO::getIsDeleted, DeletedEnums.NOT.getCode())
                .ne(id != null, BaseEntity::getId, id)
                .eq(ApiCategoryDO::getName, name)
                .eq(ApiCategoryDO::getApplicationId, applicationId)
                .exists();
    }

    @Override
    public ApiCategory byId(Long id) {
        ApiCategoryDO apiCategoryDO = dao.getById(id);
        return domainConverter.convert(apiCategoryDO);
    }

    @Override
    protected void save(ApiCategory apiCategory) {
        ApiCategoryDO entity = domainConverter.convert(apiCategory);
        dao.saveOrUpdate(entity);
    }

    @Override
    protected void delete(ApiCategory apiCategory) {
        dao.removeById(apiCategory.getId());
    }

    @Override
    protected void delete(List<Long> ids) {
        dao.removeByIds(ids);
    }
}
