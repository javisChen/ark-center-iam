package com.ark.center.iam.application.api.executor;

import cn.hutool.core.lang.Assert;
import com.ark.center.iam.application.api.event.ApiChangedEvent;
import com.ark.center.iam.application.api.event.ApiCreatedEvent;
import com.ark.center.iam.application.api.event.ApiDeletedEvent;
import com.ark.center.iam.client.api.command.ApiEnableCmd;
import com.ark.center.iam.client.api.command.ApiUpdateCmd;
import com.ark.center.iam.client.api.dto.ApiDetailDTO;
import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.client.api.query.ApiQry;
import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.gateway.ApiGateway;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.service.PermissionService;
import com.ark.center.iam.infra.api.assembler.ApiAssembler;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiAppService {

    private final ApiGateway apiGateway;
    private final PermissionService permissionService;
    private final ApiAssembler apiAssembler;
    private final ApplicationEventPublisher eventPublisher;

    public List<ApiDetailsDTO> queryList(ApiQry dto) {
        return apiGateway.selectList(dto);
    }

    public void createApplication(ApiUpdateCmd dto) {

        baseCheck(dto);

        Api apiInsert = saveApi(dto);

        addPermission(apiInsert);

        eventPublisher.publishEvent(new ApiCreatedEvent(this));

    }

    private void addPermission(Api apiInsert) {
        permissionService.addPermission(apiInsert.getId(), PermissionType.SER_API);
    }

    private void baseCheck(ApiUpdateCmd dto) {
        Api api = apiGateway.selectApiByApplicationIdAndMethodAndUrl(dto.getApplicationId(), dto.getMethod(), dto.getUri());
        Assert.isTrue(api == null || dto.getId().equals(api.getId()),
                () -> ExceptionFactory.userException("API已存在"));
    }

    private Api saveApi(ApiUpdateCmd dto) {
        Api apiInsert = apiAssembler.toApiDO(dto);
        apiGateway.insert(apiInsert);
        return apiInsert;
    }

    public ApiDetailDTO getApi(Long id) {
        Api api = apiGateway.selectById(id);
        return apiAssembler.toApiDetailDTO(api);
    }

    public void updateApi(ApiUpdateCmd dto) {

        baseCheck(dto);

        Api apiUpdate = apiAssembler.toApiDO(dto);

        apiGateway.updateApiId(apiUpdate);

        eventPublisher.publishEvent(new ApiChangedEvent(this));
    }

    public void deleteApi(Long id) {
        apiGateway.delete(id);

        eventPublisher.publishEvent(new ApiDeletedEvent(this));
    }

    public void enableOrDisable(ApiEnableCmd cmd) {
        Api api = new Api();
        api.setId(cmd.getId());
        api.setStatus(cmd.getStatus());
        apiGateway.updateApiId(api);

        eventPublisher.publishEvent(new ApiChangedEvent(this));
    }
}
