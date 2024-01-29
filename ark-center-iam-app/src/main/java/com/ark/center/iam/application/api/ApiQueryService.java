package com.ark.center.iam.application.api;

import com.ark.center.iam.client.api.dto.ApiDetailDTO;
import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.client.api.query.ApiQuery;
import com.ark.center.iam.infra.api.gateway.db.ApiMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiQueryService {

    private final ApiMapper apiMapper;

    public List<ApiDetailsDTO> queryAll(ApiQuery dto) {
        return apiMapper.selectApiList(dto);
    }

    public ApiDetailDTO queryById(Long id) {
        return null;
    }
}
