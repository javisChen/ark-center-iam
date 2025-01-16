package com.ark.center.iam.application.api;

import com.ark.center.iam.client.api.dto.ApiDTO;
import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.client.api.query.ApiQuery;
import com.ark.center.iam.infra.api.Api;
import com.ark.center.iam.infra.api.assembler.ApiAssembler;
import com.ark.center.iam.infra.api.service.ApiService;
import com.ark.center.iam.infra.enums.ApiStatusEnums;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiQueryService {

    private final ApiService apiService;
    private final ApiAssembler apiAssembler;

    public List<ApiDetailsDTO> query(ApiQuery query) {
        return apiService.query(query);
    }

    public ApiDTO getApi(Long id) {
        Api api = apiService.getById(id);
        return apiAssembler.toApiDTO(api);
    }

    public List<ApiDTO> queryAll(ApiQuery query) {
        List<Api> list = apiService.lambdaQuery()
                .eq(Api::getStatus, ApiStatusEnums.ENABLED.getValue())
                .list();
        return apiAssembler.toApiDTO(list);
    }
}
