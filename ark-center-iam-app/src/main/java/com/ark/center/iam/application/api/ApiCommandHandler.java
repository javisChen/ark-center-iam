package com.ark.center.iam.application.api;

import cn.hutool.core.lang.Assert;
import com.ark.center.iam.application.api.event.ApiChangeEvent;
import com.ark.center.iam.application.api.event.ApiCreatedEvent;
import com.ark.center.iam.application.api.executor.ApiSyncCmdExe;
import com.ark.center.iam.client.api.command.ApiEnableCommand;
import com.ark.center.iam.client.api.command.ApiSyncCommand;
import com.ark.center.iam.client.api.command.ApiCommand;
import com.ark.center.iam.client.api.enums.ApiChangeType;
import com.ark.center.iam.infra.api.Api;
import com.ark.center.iam.infra.api.service.ApiService;
import com.ark.center.iam.infra.permission.enums.PermissionType;
import com.ark.center.iam.infra.permission.gateway.impl.PermissionService;
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
    private final ApiService apiService;
    private final PermissionService permissionService;
    private final ApiAssembler apiAssembler;
    private final ApplicationEventPublisher eventPublisher;

    public void save(ApiCommand command) {

        baseCheck(command);

        Api api = apiAssembler.toApiDO(command);
        apiService.save(api);

        addPermission(api);

        eventPublisher.publishEvent(new ApiChangeEvent(this, ApiChangeType.CREATED, api.getId()));

    }

    private void addPermission(Api apiInsert) {
        permissionService.addPermission(apiInsert.getId(), PermissionType.SER_API);
    }

    private void baseCheck(ApiCommand dto) {
        Api api = apiService.selectApiByApplicationIdAndMethodAndUrl(dto.getApplicationId(), dto.getMethod(), dto.getUri());
        Assert.isTrue(api == null || dto.getId().equals(api.getId()),
                () -> ExceptionFactory.userException("API已存在"));
    }

    public void updateApi(ApiCommand dto) {

        baseCheck(dto);

        Api apiUpdate = apiAssembler.toApiDO(dto);

        apiService.updateByApiId(apiUpdate);

        eventPublisher.publishEvent(new ApiChangeEvent(this, ApiChangeType.UPDATED, dto.getId()));
    }

    public void deleteApi(Long id) {
        apiService.removeById(id);

        eventPublisher.publishEvent(new ApiChangeEvent(this, ApiChangeType.DELETED, id));
    }

    public void enableOrDisable(ApiEnableCommand cmd) {
        Api api = new Api();
        api.setId(cmd.getId());
        api.setStatus(cmd.getStatus());
        apiService.updateByApiId(api);

        eventPublisher.publishEvent(new ApiChangeEvent(this, ApiChangeType.STATUS_CHANGED, cmd.getId()));
    }

    @Transactional(rollbackFor = Throwable.class)
    public void syncApi(ApiSyncCommand command) {

        apiSyncCmdExe.execute(command);

        eventPublisher.publishEvent(new ApiCreatedEvent(this));

    }
}
