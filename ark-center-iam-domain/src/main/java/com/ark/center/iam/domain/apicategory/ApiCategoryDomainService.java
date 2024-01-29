package com.ark.center.iam.domain.apicategory;

import cn.hutool.core.lang.Assert;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ApiCategoryDomainService {

    private final ApiCategoryRepository apiCategoryRepository;

    public ApiCategory create(String name, Long applicationId) {

        checkIsDuplicate(applicationId, name);

        return new ApiCategory(name, applicationId);
    }

    public void update(ApiCategory apiCategory, Long applicationId, String name) {

        checkIsDuplicate(apiCategory.getId(), applicationId, name);

        apiCategory.update(applicationId, name);

    }

    private void checkIsDuplicate(Long applicationId, String name) {
        checkIsDuplicate(null, applicationId, name);
    }

    private void checkIsDuplicate(Long id, Long applicationId, String name) {
        Assert.isFalse(apiCategoryRepository.existsByNameAndAppId(id, name, applicationId), ExceptionFactory.userExceptionSupplier("API类目已存在"));
    }
}
