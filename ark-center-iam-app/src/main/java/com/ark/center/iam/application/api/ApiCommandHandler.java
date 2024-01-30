package com.ark.center.iam.application.api;

import com.ark.center.iam.application.api.executor.ApiSyncCmdExe;
import com.ark.center.iam.client.api.command.ApiCreateCommand;
import com.ark.center.iam.client.api.command.ApiStatusUpdateCommand;
import com.ark.center.iam.client.api.command.ApiSyncCmd;
import com.ark.center.iam.client.api.command.ApiUpdateCommand;
import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.ApiRepository;
import com.ark.center.iam.domain.api.event.ApiChangedEvent;
import com.ark.center.iam.domain.api.service.ApiDomainService;
import com.ark.center.iam.infra.api.assembler.ApiAssembler;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static cn.hutool.core.lang.Assert.notNull;

@Service
@RequiredArgsConstructor
public class ApiCommandHandler {

    private final ApiSyncCmdExe apiSyncCmdExe;
    private final ApiRepository apiRepository;
    private final ApiAssembler apiAssembler;
    private final ApplicationEventPublisher eventPublisher;
    private final ApiDomainService apiDomainService;

    public void createApi(ApiCreateCommand dto) {

        Api api = apiDomainService.create(dto.getName(),
                dto.getApplicationId(),
                dto.getCategoryId(),
                dto.getMethod(),
                dto.getUri(),
                dto.getAuthType());

        apiRepository.persist(api);

    }

    public void updateApi(ApiUpdateCommand dto) {

        Api api = apiRepository.byId(dto.getId());

        apiDomainService.update(api, dto.getName(), dto.getApplicationId(), dto.getCategoryId(), dto.getMethod(), dto.getUri(), dto.getAuthType());

        eventPublisher.publishEvent(new ApiChangedEvent(this, api.getId()));
    }

    public void deleteApi(Long id) {

        Api api = apiRepository.byId(id);

        api.onDelete();

        apiRepository.deleteById(id);

    }

    public void changeStatus(ApiStatusUpdateCommand cmd) {

        Api api = apiRepository.byId(cmd.getId());

        notNull(api, ExceptionFactory.userExceptionSupplier("Api不存在"));

        api.changeStatus(EnableDisableStatus.from(cmd.getStatus()));

        apiRepository.persist(api);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void syncApi(ApiSyncCmd cmd) {

        apiSyncCmdExe.execute(cmd);

    }
}
