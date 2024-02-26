package com.ark.center.iam.application.apicategory;

import com.ark.center.iam.application.apicategory.assembler.ApiCategoryAssembler;
import com.ark.center.iam.infra.apicategory.repository.db.ApiCategoryDAO;
import com.ark.center.iam.infra.apicategory.repository.db.ApiCategoryDO;
import com.ark.center.iam.model.api.dto.ApiCategoryBaseDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ApiCategoryQueryService {

    private final ApiCategoryDAO apiCategoryDAO;

    private final ApiCategoryAssembler apiCategoryAssembler;

    public List<ApiCategoryBaseDTO> queryAll(Long applicationId) {
        return apiCategoryDAO.lambdaQuery()
                .eq(ApiCategoryDO::getApplicationId, applicationId)
                .list()
                .stream()
                .map(apiCategoryAssembler::toApiCategoryDTO)
                .collect(Collectors.toList());
    }
}
