package com.ark.center.iam.application.api;

import com.ark.center.iam.client.api.dto.ApiCategoryBaseDTO;
import com.ark.center.iam.infra.api.service.ApiCategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiCategoryQueryService {

    private final ApiCategoryService apiCategoryService;

    public List<ApiCategoryBaseDTO> queryPages(Long applicationId) {
        return apiCategoryService.selectList(applicationId);
    }

}
