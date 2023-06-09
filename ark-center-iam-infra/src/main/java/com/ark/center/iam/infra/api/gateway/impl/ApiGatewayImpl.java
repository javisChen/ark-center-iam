package com.ark.center.iam.infra.api.gateway.impl;

import com.ark.center.iam.client.api.dto.ApiListDTO;
import com.ark.center.iam.client.api.query.ApiQry;
import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.gateway.ApiGateway;
import com.ark.center.iam.infra.api.assembler.ApiAssembler;
import com.ark.center.iam.infra.api.gateway.db.ApiMapper;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class ApiGatewayImpl extends ServiceImpl<ApiMapper, Api> implements ApiGateway {

    private final ApiAssembler apiAssembler;

    @Override
    public List<ApiListDTO> selectList(ApiQry apiQry) {
        return lambdaQuery()
                .eq(Api::getApplicationId, apiQry.getApplicationId())
                .eq(Api::getCategoryId, apiQry.getCategoryId())
                .eq(apiQry.getAuthType() != null, Api::getAuthType, apiQry.getAuthType())
                .eq(Api::getIsDeleted, DeletedEnums.NOT.getCode())
                .list()
                .stream()
                .map(apiAssembler::toApiDTO).collect(Collectors.toList());

    }

    @Override
    public Api selectApiByApplicationIdAndMethodAndUrl(Long applicationId, String method, String url) {
        return lambdaQuery()
                .eq(Api::getUrl, url)
                .eq(Api::getMethod, method)
                .eq(Api::getApplicationId, applicationId)
                .eq(Api::getIsDeleted, DeletedEnums.NOT.getCode())
                .one();
    }

    @Override
    public void insert(Api api) {
        sae
    }
}
