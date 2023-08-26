package com.ark.center.iam.application.api.executor;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.lang.Assert;
import com.alibaba.cloud.nacos.discovery.NacosServiceDiscovery;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
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
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
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

        JSONObject openAPI = getOpenAPI(serviceInstance);

        List<Api> serviceApis = collectServiceApis(application, openAPI);

        saveApis(application, serviceApis);

    }

    private void saveApis(Application application, List<Api> serviceApis) {
        if (CollectionUtil.isEmpty(serviceApis)) {
            log.info("服务没有Api信息");
            return;
        }
        List<Api> insertApis = Lists.newArrayList();
        List<Api> updateApis = Lists.newArrayList();
        // 以uri + method作为唯一标识，不存在的添加，已经在的更新下名字
        List<Api> existingApis = apiGateway.selectByApplicationId(application.getId());
        if (CollectionUtil.isNotEmpty(existingApis)) {
            Map<String, Api> existingApisMap = existingApis.stream()
                    .collect(Collectors.toMap(item -> item.getUri() + ":" + item.getMethod(), Function.identity()));
            // 找出已存在的Api，更新下名字
            for (Api serviceApi : serviceApis) {
                Api originalApi = existingApisMap.get(serviceApi.getUri() + ":" + serviceApi.getMethod());
                if (originalApi == null) {
                    insertApis.add(serviceApi);
                } else {
                    originalApi.setName(serviceApi.getName());
                    updateApis.add(originalApi);
                }
            }
        } else {
            insertApis.addAll(serviceApis);
        }

        for (Api api : insertApis) {

            apiGateway.insert(api);

            permissionService.addPermission(api.getId(), PermissionType.SER_API);

        }

        for (Api api : updateApis) {
            apiGateway.updateByApiId(api);
        }
    }

    private List<Api> collectServiceApis(Application application, JSONObject openAPI) {
        List<Api> apis = new ArrayList<>();
        JSONObject paths = openAPI.getJSONObject("paths");
        paths.forEach((uri, value) -> {
            JSONObject pathItem = (JSONObject) value;
            pathItem.entrySet()
                    .stream()
                    .map(pathItemEntry -> assembleApi(application, uri, pathItemEntry))
                    .forEach(apis::add);
        });
        return apis;
    }

    @NotNull
    private Api assembleApi(Application application, String uri, Map.Entry<String, Object> operation) {
        String method = operation.getKey();
        JSONObject methodInfo = (JSONObject) operation.getValue();
        String summary = StringUtils.defaultIfBlank(methodInfo.getString("summary"), "");
        Api api = new Api();
        api.setName(summary);
        api.setApplicationId(application.getId());
        api.setCategoryId(0L);
        api.setHasPathVariable(false);
        api.setUri(uri);
        api.setMethod(method.toLowerCase());
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
            Assert.notEmpty(instances, () -> ExceptionFactory.sysException("服务不在线,无法获取Api信息"));
            serviceInstance = instances.get(0);
        } catch (NacosException e) {
            log.error("读取服务实例失败", e);
            throw ExceptionFactory.sysException("获取服务实例失败");
        }
        return serviceInstance;
    }

    @NotNull
    private JSONObject getOpenAPI(ServiceInstance serviceInstance) {
        HttpRequest request = HttpRequest.newBuilder()
                .GET()
                .uri(URI.create(serviceInstance.getUri() + "/v3/api-docs"))
                .build();
        try {
            HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
            return JSON.parseObject(response.body());
        } catch (Exception e) {
            log.error("请求服务失败", e);
            throw ExceptionFactory.sysException("请求服务失败,请稍候重试");
        }
    }

}
