package com.ark.center.iam.application.api;

import cn.hutool.core.lang.Assert;
import com.ark.center.iam.client.api.command.ApiCategoryCmd;
import com.ark.center.iam.client.api.dto.ApiCategoryBaseDTO;
import com.ark.center.iam.infra.api.ApiCategory;
import com.ark.center.iam.infra.api.assembler.ApiCategoryAssembler;
import com.ark.center.iam.infra.api.service.ApiCategoryService;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiCategoryCommandHandler {

    private final ApiCategoryService apiCategoryService;

    private final ApiCategoryAssembler apiCategoryAssembler;

    public List<ApiCategoryBaseDTO> queryList(Long applicationId) {
        return apiCategoryService.selectList(applicationId);
    }

    public void createApiCategory(ApiCategoryCmd dto) {
        ApiCategory one = apiCategoryService.selectByNameAndApplicationId(dto.getName(), dto.getApplicationId());
        Assert.isNull(one, () -> ExceptionFactory.userException("API类目已存在"));
        ApiCategory apiCategory = apiCategoryAssembler.toApiCategoryDO(dto);
        apiCategoryService.insert(apiCategory);
    }

    public void updateApiCategory(ApiCategoryCmd dto) {
        ApiCategory one = apiCategoryService.selectByNameAndApplicationId(dto.getName(), dto.getApplicationId());
        Assert.isTrue(one != null && !dto.getId().equals(one.getId()), () -> ExceptionFactory.userException("API类目已存在"));
        ApiCategory apiCategory = apiCategoryAssembler.toApiCategoryDO(dto);
        apiCategoryService.update(apiCategory);
    }

    public void deleteApiCategory(Long id) {
        apiCategoryService.logicDelete(id);
    }
}
