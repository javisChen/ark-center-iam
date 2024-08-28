package com.ark.center.iam.infra.api.gateway.impl;

import com.ark.center.iam.client.api.dto.ApiCategoryBaseDTO;
import com.ark.center.iam.infra.api.ApiCategory;
import com.ark.center.iam.infra.api.gateway.ApiCategoryGateway;
import com.ark.center.iam.infra.api.assembler.ApiCategoryAssembler;
import com.ark.center.iam.infra.api.gateway.db.ApiCategoryMapper;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ApiCategoryGatewayImpl extends ServiceImpl<ApiCategoryMapper, ApiCategory> implements ApiCategoryGateway {

    private final ApiCategoryAssembler apiCategoryAssembler;

    @Override
    public List<ApiCategoryBaseDTO> selectList(Long applicationId) {
        return lambdaQuery()
                .eq(ApiCategory::getIsDeleted, DeletedEnums.NOT.getCode())
                .eq(ApiCategory::getApplicationId, applicationId)
                .list()
                .stream()
                .map(apiCategoryAssembler::toApiCategoryDTO)
                .toList();
    }

    @Override
    public void insert(ApiCategory apiCategory) {
        save(apiCategory);
    }

    @Override
    public ApiCategory selectByNameAndApplicationId(String name, Long applicationId) {
        return lambdaQuery()
                .eq(ApiCategory::getIsDeleted, DeletedEnums.NOT.getCode())
                .eq(ApiCategory::getName, name)
                .eq(ApiCategory::getApplicationId, applicationId)
                .one();
    }

    @Override
    public void update(ApiCategory apiCategory) {
        updateById(apiCategory);
    }

    @Override
    public void logicDelete(Long id) {
        lambdaUpdate()
                .eq(ApiCategory::getId, id)
                .eq(ApiCategory::getIsDeleted, DeletedEnums.NOT.getCode())
                .set(ApiCategory::getIsDeleted, id)
                .update();

    }

    @Override
    public List<ApiCategory> selectByApplicationId(Long applicationId) {
        return lambdaQuery()
                .eq(ApiCategory::getApplicationId, applicationId)
                .list();
    }
}
