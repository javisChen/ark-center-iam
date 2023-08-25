package com.ark.center.iam.application.api;

import cn.hutool.core.lang.Assert;
import com.ark.center.iam.client.api.command.ApiCategoryCmd;
import com.ark.center.iam.client.api.dto.ApiCategoryBaseDTO;
import com.ark.center.iam.domain.api.ApiCategory;
import com.ark.center.iam.domain.api.gateway.ApiCategoryGateway;
import com.ark.center.iam.infra.api.assembler.ApiCategoryAssembler;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiCategoryAppService {

    private final ApiCategoryGateway apiCategoryGateway;

    private final ApiCategoryAssembler apiCategoryAssembler;

    public List<ApiCategoryBaseDTO> queryList(Long applicationId) {
        return apiCategoryGateway.selectList(applicationId);
    }

    public void createApiCategory(ApiCategoryCmd dto) {
        ApiCategory one = apiCategoryGateway.selectByNameAndApplicationId(dto.getName(), dto.getApplicationId());
        Assert.isTrue(one != null, () -> ExceptionFactory.userException("API类目已存在"));
        ApiCategory apiCategory = apiCategoryAssembler.toApiCategoryDO(dto);
        apiCategoryGateway.insert(apiCategory);
    }

    public void updateApiCategory(ApiCategoryCmd dto) {
        ApiCategory one = apiCategoryGateway.selectByNameAndApplicationId(dto.getName(), dto.getApplicationId());
        Assert.isTrue(one != null && !dto.getId().equals(one.getId()), () -> ExceptionFactory.userException("API类目已存在"));
        ApiCategory apiCategory = apiCategoryAssembler.toApiCategoryDO(dto);
        apiCategoryGateway.update(apiCategory);
    }

    public void deleteApiCategory(Long id) {
        apiCategoryGateway.logicDelete(id);
    }
}
