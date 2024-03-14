package com.ark.center.iam.application.api;

import com.ark.center.iam.infra.api.converter.ApiAppConverter;
import com.ark.center.iam.infra.api.repository.db.ApiDAO;
import com.ark.center.iam.infra.api.repository.db.ApiDO;
import com.ark.center.iam.infra.api.repository.db.ApiMapper;
import com.ark.center.iam.model.api.dto.ApiDetailDTO;
import com.ark.center.iam.model.api.dto.ApiDetailsDTO;
import com.ark.center.iam.model.api.query.ApiQuery;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiQueryService {

    private final ApiMapper apiMapper;
    private final ApiDAO apiDAO;
    private final ApiAppConverter apiAppConverter;

    public List<ApiDetailsDTO> queryAll(ApiQuery dto) {
        return apiMapper.selectApiList(dto);
    }

    public ApiDetailDTO queryById(Long id) {
        ApiDO apiDO = apiDAO.getById(id);
        return apiAppConverter.toDetailDTO(apiDO);
    }
}
