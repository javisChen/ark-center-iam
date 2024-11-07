package com.ark.center.iam.infra.api.service;

import com.ark.center.iam.client.api.dto.ApiCategoryBaseDTO;
import com.ark.center.iam.infra.api.ApiCategory;
import com.ark.center.iam.infra.api.assembler.ApiCategoryAssembler;
import com.ark.center.iam.infra.api.gateway.db.ApiCategoryMapper;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ApiCategoryService extends ServiceImpl<ApiCategoryMapper, ApiCategory> {

    private final ApiCategoryAssembler apiCategoryAssembler;

    public List<ApiCategoryBaseDTO> selectList(Long applicationId) {
        return lambdaQuery()
                .eq(ApiCategory::getIsDeleted, DeletedEnums.NOT.getCode())
                .eq(ApiCategory::getApplicationId, applicationId)
                .list()
                .stream()
                .map(apiCategoryAssembler::toApiCategoryDTO)
                .toList();
    }

    public void insert(ApiCategory apiCategory) {
        save(apiCategory);
    }

    public ApiCategory selectByNameAndApplicationId(String name, Long applicationId) {
        return lambdaQuery()
                .eq(ApiCategory::getIsDeleted, DeletedEnums.NOT.getCode())
                .eq(ApiCategory::getName, name)
                .eq(ApiCategory::getApplicationId, applicationId)
                .one();
    }

    public void update(ApiCategory apiCategory) {
        updateById(apiCategory);
    }

    public void logicDelete(Long id) {
        lambdaUpdate()
                .eq(ApiCategory::getId, id)
                .eq(ApiCategory::getIsDeleted, DeletedEnums.NOT.getCode())
                .set(ApiCategory::getIsDeleted, id)
                .update();

    }

    public List<ApiCategory> selectByApplicationId(Long applicationId) {
        return lambdaQuery()
                .eq(ApiCategory::getApplicationId, applicationId)
                .list();
    }
}
