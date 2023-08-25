package com.ark.center.iam.application.api.executor;

import cn.hutool.core.collection.CollectionUtil;
import com.alibaba.cloud.nacos.discovery.NacosServiceDiscovery;
import com.alibaba.fastjson.JSON;
import com.alibaba.nacos.api.exception.NacosException;
import com.ark.center.iam.client.api.command.ApiSyncCmd;
import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.gateway.ApiGateway;
import com.ark.center.iam.domain.application.Application;
import com.ark.center.iam.domain.application.gateway.ApplicationGateway;
import com.ark.center.iam.domain.enums.ApiAuthTypeEnums;
import com.ark.center.iam.domain.enums.ApiStatusEnums;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.service.PermissionService;
import com.ark.component.exception.ExceptionFactory;
import com.google.common.collect.Lists;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.Operation;
import io.swagger.v3.oas.models.Paths;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.stereotype.Component;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Component
@Slf4j
public class ApiSyncCmdExe {

    private final ApplicationGateway applicationGateway;

    private final ApiGateway apiGateway;

    private final NacosServiceDiscovery nacosServiceDiscovery;
    private final PermissionService permissionService;

    public void execute(ApiSyncCmd cmd) {

        Application application = getApplication(cmd);

        ServiceInstance serviceInstance = getServiceInstance(application);

        OpenAPI openAPI = getOpenAPI(serviceInstance);

        List<Api> serviceApis = collectServiceApis(application, openAPI);

        saveApis(application, serviceApis);

    }

    private void saveApis(Application application, List<Api> serviceApis) {
        if (CollectionUtil.isEmpty(serviceApis)) {
            log.info("服务没有Api信息");
            return;
        }
        List<Api> finalApis = Lists.newArrayList();
        // 以uri + method作为唯一标识，不存在的添加，已经在的更新下名字
        List<Api> existingApis = apiGateway.selectByApplicationId(application.getId());
        if (CollectionUtil.isNotEmpty(existingApis)) {
            Map<String, Api> existingApisMap = existingApis.stream()
                    .collect(Collectors.toMap(item -> item.getUri() + ":" + item.getMethod(), Function.identity()));
            // 找出已存在的Api，更新下名字
            for (Api serviceApi : serviceApis) {
                Api originalApi = existingApisMap.get(serviceApi.getUri() + ":" + serviceApi.getMethod());
                if (originalApi == null) {
                    finalApis.add(serviceApi);
                } else {
                    originalApi.setName(serviceApi.getName());
                    finalApis.add(originalApi);
                }
            }
        } else {
            finalApis.addAll(serviceApis);
        }

        for (Api api : finalApis) {

            apiGateway.insertOrUpdate(api);

            permissionService.addPermission(api.getId(), PermissionType.SER_API);
        }
    }

    private List<Api> collectServiceApis(Application application, OpenAPI openAPI) {
        List<Api> apis = new ArrayList<>();
        Paths paths = openAPI.getPaths();
        paths.forEach((uri, pathItem) -> {
            for (Operation operation : pathItem.readOperations()) {
                Api api = assembleApi(application, uri, operation);
                apis.add(api);
            }
        });
        return apis;
    }

    @NotNull
    private Api assembleApi(Application application, String uri, Operation operation) {
        Api api = new Api();
        api.setName(operation.getSummary());
        api.setApplicationId(application.getId());
        api.setCategoryId(0L);
        api.setHasPathVariable(false);
        api.setName(uri);
        api.setUri(uri);
        api.setMethod(operation.toString());
        api.setAuthType(ApiAuthTypeEnums.NEED_AUTHENTICATION_AND_AUTHORIZATION.getValue());
        api.setStatus(ApiStatusEnums.ENABLED.getValue());
        return api;
    }

    private Application getApplication(ApiSyncCmd cmd) {
        Long applicationId = cmd.getApplicationId();
        return applicationGateway.selectById(applicationId);
    }

    private ServiceInstance getServiceInstance(Application application) {
        ServiceInstance serviceInstance;
        try {
            List<ServiceInstance> instances = nacosServiceDiscovery.getInstances(application.getCode());
            serviceInstance = instances.get(0);
        } catch (NacosException e) {
            log.error("读取服务实例失败", e);
            throw ExceptionFactory.sysException("服务不在线,无法获取Api信息");
        }
        return serviceInstance;
    }

    @NotNull
    private OpenAPI getOpenAPI(ServiceInstance serviceInstance) {
        HttpRequest request = HttpRequest.newBuilder()
                .GET()
                .uri(URI.create(serviceInstance.getUri() + "/v3/api-docs"))
                .build();
        try {
            HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
            String body = response.body();
            return JSON.parseObject(body, OpenAPI.class);
        } catch (Exception e) {
            log.error("请求服务失败", e);
            throw ExceptionFactory.sysException("请求服务失败,请稍候重试");
        }
    }
}
