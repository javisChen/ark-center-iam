package com.ark.center.iam.application.api;

import com.ark.center.iam.client.api.dto.ApiDetailDTO;
import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.client.api.query.ApiQuery;
import com.ark.center.iam.infra.api.Api;
import com.ark.center.iam.infra.api.assembler.ApiAssembler;
import com.ark.center.iam.infra.api.service.ApiService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiQueryService {

    private final ApiService apiService;
    private final ApiAssembler apiAssembler;

    public List<ApiDetailsDTO> queryList(ApiQuery dto) {
        return apiService.selectList(dto);
    }

    public ApiDetailDTO getApi(Long id) {
        Api api = apiService.selectById(id);
        return apiAssembler.toApiDetailDTO(api);
    }

}
