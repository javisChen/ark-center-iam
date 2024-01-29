package com.ark.center.iam.application.apicategory;

import com.ark.center.iam.client.apicategory.command.ApiCategoryCreateCommand;
import com.ark.center.iam.client.apicategory.command.ApiCategoryUpdateCommand;
import com.ark.center.iam.domain.apicategory.ApiCategory;
import com.ark.center.iam.domain.apicategory.ApiCategoryDomainService;
import com.ark.center.iam.domain.apicategory.ApiCategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ApiCategoryCommandHandler {

    private final ApiCategoryRepository apiCategoryRepository;

    private final ApiCategoryDomainService apiCategoryDomainService;

    public void create(ApiCategoryCreateCommand command) {

        ApiCategory apiCategory = apiCategoryDomainService.create(command.getName(), command.getApplicationId());

        apiCategoryRepository.persist(apiCategory);
    }

    public void update(ApiCategoryUpdateCommand command) {

        ApiCategory apiCategory = apiCategoryRepository.byId(command.getId());

        apiCategoryDomainService.update(apiCategory, command.getApplicationId(), command.getName());

        apiCategoryRepository.persist(apiCategory);
    }

    public void delete(Long id) {
        apiCategoryRepository.deleteById(id);
    }

}
