package com.ark.center.iam.application.apicategory;

import com.ark.center.iam.client.apicategory.command.ApiCategoryCreateCommand;
import com.ark.center.iam.client.apicategory.command.ApiCategoryUpdateCommand;
import com.ark.center.iam.domain.apicategory.ApiCategory;
import com.ark.center.iam.domain.apicategory.ApiCategoryDomainService;
import com.ark.center.iam.domain.apicategory.ApiCategoryGateway;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ApiCategoryCommandHandler {

    private final ApiCategoryGateway apiCategoryGateway;

    private final ApiCategoryDomainService apiCategoryDomainService;

    public void handleCreate(ApiCategoryCreateCommand command) {

        ApiCategory apiCategory = apiCategoryDomainService.create(command.getName(), command.getApplicationId());

        apiCategoryGateway.save(apiCategory);
    }

    public void handleUpdate(ApiCategoryUpdateCommand command) {

        ApiCategory apiCategory = apiCategoryGateway.byId(command.getId());

        apiCategoryDomainService.update(apiCategory, command.getApplicationId(), command.getName());

        apiCategoryGateway.save(apiCategory);
    }

    public void handleDelete(Long id) {
        apiCategoryGateway.delete(id);
    }

}
