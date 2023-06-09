package com.ark.center.iam.application.api.executor;

import cn.hutool.core.lang.Assert;
import com.ark.center.iam.client.api.command.ApiUpdateCmd;
import com.ark.center.iam.client.api.dto.ApiListDTO;
import com.ark.center.iam.client.api.query.ApiQry;
import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.gateway.ApiGateway;
import com.ark.center.iam.infra.api.assembler.ApiAssembler;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiAppService {

    private final ApiGateway apiGateway;

    private final ApiAssembler apiAssembler;

    public List<ApiListDTO> queryList(ApiQry dto) {
        return apiGateway.selectList(dto);
    }

    public void createApplication(ApiUpdateCmd dto) {
        Api api = apiGateway.selectApiByApplicationIdAndMethodAndUrl(dto.getApplicationId(), dto.getMethod(), dto.getUrl());
        Assert.isTrue(api != null, () -> ExceptionFactory.userException("API已存在"));

        api = apiAssembler.toAPIDO(dto);
        apiGateway.insert(api);

        iPermissionService.addPermission(api.getId(), PermissionTypeEnums.SER_API);
    }

}
