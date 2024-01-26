package com.ark.center.iam.infra.api.gateway.impl;

import com.ark.center.iam.domain.apicategory.ApiCategory;
import com.ark.center.iam.domain.apicategory.ApiCategoryGateway;
import com.ark.center.iam.infra.api.assembler.ApiCategoryAssembler;
import com.ark.center.iam.infra.api.gateway.db.ApiCategoryMapper;
import com.ark.component.web.common.DeletedEnums;
import com.ark.component.ddd.domain.AggregateRoot;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ApiCategoryGatewayImpl implements ApiCategoryGateway {

    private final ApiCategoryAssembler apiCategoryAssembler;
    private final ApiCategoryMapper apiCategoryMapper;

    @Override
    public void save(ApiCategory apiCategory) {
        apiCategoryMapper.insert(apiCategory);
    }

    @Override
    public boolean exists(String name, Long applicationId) {
        LambdaQueryWrapper<ApiCategory> qw = Wrappers.lambdaQuery(ApiCategory.class)
                .eq(ApiCategory::getIsDeleted, DeletedEnums.NOT.getCode())
                .eq(ApiCategory::getName, name)
                .eq(ApiCategory::getApplicationId, applicationId);
        return apiCategoryMapper.exists(qw);
    }

    @Override
    public void update(ApiCategory apiCategory) {
        updateById(apiCategory);
    }

    @Override
    public void delete(Long id) {
        LambdaUpdateWrapper<ApiCategory> uw = Wrappers.lambdaUpdate(ApiCategory.class)
                .eq(ApiCategory::getId, id);
        apiCategoryMapper.delete(uw);

    }

    @Override
    public List<ApiCategory> selectByApplicationId(Long applicationId) {
        return lambdaQuery()
                .eq(ApiCategory::getApplicationId, applicationId)
                .list();
    }

    @Override
    public boolean existsByNameAndAppId(Long id, String name, Long applicationId) {
        LambdaQueryWrapper<ApiCategory> qw = Wrappers.lambdaQuery(ApiCategory.class)
                .eq(ApiCategory::getIsDeleted, DeletedEnums.NOT.getCode())
                .ne(id != null, AggregateRoot::getId, id)
                .eq(ApiCategory::getName, name)
                .eq(ApiCategory::getApplicationId, applicationId);
        return apiCategoryMapper.exists(qw);
    }

    @Override
    public ApiCategory byId(Long id) {
        return apiCategoryMapper.selectById(id);
    }
}
