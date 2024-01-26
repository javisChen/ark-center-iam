package com.ark.center.iam.application.apicategory;

import com.ark.center.iam.application.apicategory.assembler.ApiCategoryAssembler;
import com.ark.center.iam.client.api.dto.ApiCategoryBaseDTO;
import com.ark.center.iam.domain.apicategory.ApiCategory;
import com.ark.center.iam.infra.api.gateway.db.ApiCategoryMapper;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiCategoryQueryService {

    private final ApiCategoryMapper apiCategoryMapper;

    private final ApiCategoryAssembler apiCategoryAssembler;

    public List<ApiCategoryBaseDTO> queryAll(Long applicationId) {
        LambdaQueryWrapper<ApiCategory> qw = Wrappers.lambdaQuery(ApiCategory.class)
                .eq(ApiCategory::getIsDeleted, DeletedEnums.NOT.getCode())
                .eq(ApiCategory::getApplicationId, applicationId);
        return apiCategoryMapper.selectList(qw)
                .stream()
                .map(apiCategoryAssembler::toApiCategoryDTO)
                .toList();
    }
}
