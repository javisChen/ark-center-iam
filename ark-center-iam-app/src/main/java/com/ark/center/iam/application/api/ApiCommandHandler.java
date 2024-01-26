package com.ark.center.iam.application.api;

import cn.hutool.core.lang.Assert;
import com.ark.center.iam.application.api.event.ApiChangedEvent;
import com.ark.center.iam.application.api.event.ApiCreatedEvent;
import com.ark.center.iam.application.api.event.ApiDeletedEvent;
import com.ark.center.iam.application.api.executor.ApiSyncCmdExe;
import com.ark.center.iam.client.api.command.ApiCreateCommand;
import com.ark.center.iam.client.api.command.ApiStatusUpdateCommand;
import com.ark.center.iam.client.api.command.ApiSyncCmd;
import com.ark.center.iam.client.api.command.ApiUpdateCommand;
import com.ark.center.iam.client.api.dto.ApiDetailDTO;
import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.gateway.ApiGateway;
import com.ark.center.iam.domain.api.service.ApiDomainService;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.service.PermissionService;
import com.ark.center.iam.infra.api.assembler.ApiAssembler;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ApiCommandHandler {

    private final ApiSyncCmdExe apiSyncCmdExe;
    private final ApiGateway apiGateway;
    private final PermissionService permissionService;
    private final ApiAssembler apiAssembler;
    private final ApplicationEventPublisher eventPublisher;
    private final ApiDomainService apiDomainService;

    public void createApi(ApiCreateCommand dto) {

        apiDomainService.create()

        baseCheck(dto);

        Api apiInsert = saveApi(dto);

        addPermission(apiInsert);

        eventPublisher.publishEvent(new ApiCreatedEvent(this));

    }

    private void addPermission(Api apiInsert) {
        permissionService.addPermission(apiInsert.getId(), PermissionType.SER_API);
    }

    private void baseCheck(ApiUpdateCommand dto) {
        Api api = apiGateway.selectApiByApplicationIdAndMethodAndUrl(dto.getApplicationId(), dto.getMethod(), dto.getUri());
        Assert.isTrue(api == null || dto.getId().equals(api.getId()),
                () -> ExceptionFactory.userException("API已存在"));
    }

    private Api saveApi(ApiUpdateCommand dto) {
        Api apiInsert = apiAssembler.toApiDO(dto);
        apiGateway.insert(apiInsert);
        return apiInsert;
    }

    public ApiDetailDTO getApi(Long id) {
        Api api = apiGateway.selectById(id);
        return apiAssembler.toApiDetailDTO(api);
    }

    public void updateApi(ApiUpdateCommand dto) {

        baseCheck(dto);

        Api apiUpdate = apiAssembler.toApiDO(dto);

        apiGateway.updateByApiId(apiUpdate);

        eventPublisher.publishEvent(new ApiChangedEvent(this));
    }

    public void deleteApi(Long id) {
        apiGateway.delete(id);

        eventPublisher.publishEvent(new ApiDeletedEvent(this));
    }

    public void handleChangeStatus(ApiStatusUpdateCommand cmd) {
        Api api = new Api();
        api.setId(cmd.getId());
        api.setStatus(cmd.getStatus());
        apiGateway.updateByApiId(api);

        eventPublisher.publishEvent(new ApiChangedEvent(this));
    }

    @Transactional(rollbackFor = Throwable.class)
    public void syncApi(ApiSyncCmd cmd) {

        apiSyncCmdExe.execute(cmd);

        eventPublisher.publishEvent(new ApiCreatedEvent(this));

    }
}
