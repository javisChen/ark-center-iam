package com.ark.center.iam.application.api.executor;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.lang.Assert;
import com.alibaba.cloud.nacos.discovery.NacosServiceDiscovery;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.alibaba.nacos.api.exception.NacosException;
import com.ark.center.iam.client.api.command.ApiSyncCommand;
import com.ark.center.iam.infra.api.Api;
import com.ark.center.iam.infra.api.ApiCategory;
import com.ark.center.iam.infra.api.service.ApiCategoryService;
import com.ark.center.iam.infra.api.service.ApiService;
import com.ark.center.iam.infra.application.Application;
import com.ark.center.iam.infra.application.service.ApplicationService;
import com.ark.center.iam.client.contants.ApiAuthType;
import com.ark.center.iam.infra.enums.ApiStatusEnums;
import com.ark.center.iam.infra.permission.enums.PermissionType;
import com.ark.center.iam.infra.permission.gateway.impl.PermissionService;
import com.ark.component.exception.ExceptionFactory;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.collections4.MapUtils;
import org.apache.commons.collections4.keyvalue.MultiKey;
import org.apache.commons.collections4.map.MultiKeyMap;
import org.jetbrains.annotations.NotNull;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.stereotype.Component;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.*;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Component
@Slf4j
public class ApiSyncCmdExe {

    private final ApplicationService applicationGateway;

    private final ApiService apiService;

    private final ApiCategoryService apiCategoryService;

    private final NacosServiceDiscovery nacosServiceDiscovery;

    private final PermissionService permissionService;

    public void execute(ApiSyncCommand cmd) {

        Application application = getApplication(cmd);

        // 通过服务发现选择可用的应用实例
        ServiceInstance serviceInstance = getServiceInstance(application);

        // 获取应用的OpenApi信息
        JSONObject openAPI = getOpenAPI(serviceInstance);

        // 提取服务所有Api信息
        List<String> tags = extractTags(openAPI);

        // 查询应用下的所有Api分类
        List<ApiCategory> apiCategories = saveApiCategories(application, tags);

        // 提取服务所有Api信息
        List<Api> serviceApis = extractServiceApis(openAPI, serviceInstance, application, apiCategories);

        // 保存Api
        saveApis(application, serviceApis, apiCategories);

    }

    private List<ApiCategory> saveApiCategories(Application application, List<String> tags) {
        List<ApiCategory> existsCategories = apiCategoryService.selectByApplicationId(application.getId());
        Set<String> existsCategoryNames = existsCategories.stream()
                .map(ApiCategory::getName)
                .collect(Collectors.toSet());
        List<String> newCategories = tags.stream()
                .filter(tag -> !existsCategoryNames.contains(tag))
                .toList();
        if (CollectionUtils.isEmpty(newCategories)) {
            return existsCategories;
        }

        // 插入新的Api分类
        newCategories
                .stream()
                .distinct()
                .map(tag -> {
                    ApiCategory apiCategory = new ApiCategory();
                    apiCategory.setName(tag);
                    apiCategory.setApplicationId(application.getId());
                    return apiCategory;
                })
                .forEach(apiCategoryService::insert);
        return apiCategoryService.selectByApplicationId(application.getId());
    }

    /**
     * 提取所有的Tag
     */
    private List<String> extractTags(JSONObject openAPI) {
        JSONObject paths = openAPI.getJSONObject("paths");
        if (MapUtils.isEmpty(paths)) {
            return Collections.emptyList();
        }
        List<String> apis = new ArrayList<>();
        paths.forEach((uri, value) -> {
            JSONObject pathItem = (JSONObject) value;
            pathItem.values()
                    .stream()
                    .map(o -> {
                        JSONObject methodInfo = (JSONObject) o;
                        JSONArray tags = methodInfo.getJSONArray("tags");
                        return tags.stream().map(String::valueOf).collect(Collectors.toList());
                    })
                    .forEach(apis::addAll);
        });
        return apis;
    }

    private void saveApis(Application application, List<Api> serviceApis, List<ApiCategory> apiCategories) {
        int size = serviceApis.size();
        List<Api> insertApis = Lists.newArrayListWithCapacity(size);
        List<Api> updateApis = Lists.newArrayListWithCapacity(size);
        // 以uri + method + categoryId 作为唯一标识，不存在的添加，已经在的更新。
        MultiKeyMap<String, Api> existsApisMap = queryExistsApis(application);
        if (CollectionUtil.isNotEmpty(existsApisMap)) {
            // 找出已存在的Api，更新下名字
            for (Api serviceApi : serviceApis) {
                Api originalApi = existsApisMap.get(createApiMultiKey(serviceApi));
                if (originalApi == null) {
                    insertApis.add(serviceApi);
                } else {
                    originalApi.setName(serviceApi.getName());
                    originalApi.setCategoryId(serviceApi.getCategoryId());
                    updateApis.add(originalApi);
                }
            }
        } else {
            insertApis.addAll(serviceApis);
        }

        for (Api api : insertApis) {
            apiService.save(api);
            permissionService.addPermission(api.getId(), PermissionType.SER_API);
        }

        for (Api api : updateApis) {
            apiService.updateByApiId(api);
        }
    }

    /**
     * 复合Key，uri + method + categoryId
     */
    private MultiKey<String> createApiMultiKey(Api serviceApi) {
        return new MultiKey<>(serviceApi.getUri(),
                serviceApi.getMethod());
    }

    private MultiKeyMap<String, Api> queryExistsApis(Application application) {
        List<Api> existingApis = apiService.selectByApplicationId(application.getId());
        MultiKeyMap<String, Api> map = new MultiKeyMap<>();
        for (Api existingApi : existingApis) {
            map.put(createApiMultiKey(existingApi), existingApi);
        }
        return map;
    }

    private List<Api> extractServiceApis(JSONObject openAPI,
                                         ServiceInstance serviceInstance,
                                         Application application,
                                         List<ApiCategory> apiCategories) {
        JSONObject paths = openAPI.getJSONObject("paths");
        if (MapUtils.isEmpty(paths)) {
            return Collections.emptyList();
        }
        // 建立名字和id的映射关系
        Map<String, Long> categoriesMappings = apiCategories.stream()
                .collect(Collectors.toMap(ApiCategory::getName, BaseEntity::getId, (k1, k2) -> k1));
        List<Api> apis = new ArrayList<>();
        paths.forEach((uri, value) -> {
            JSONObject pathItem = (JSONObject) value;
            pathItem.entrySet()
                    .stream()
                    .map(pathItemEntry -> assembleApi(serviceInstance, application, uri, pathItemEntry, categoriesMappings))
                    .forEach(apis::add);
        });
        return apis;
    }

    private Api assembleApi(ServiceInstance serviceInstance,
                            Application application,
                            String uri,
                            Map.Entry<String, Object> operation,
                            Map<String, Long> categoriesMappings) {
        String method = operation.getKey();
        JSONObject methodInfo = (JSONObject) operation.getValue();
        String summary = MapUtils.getString(methodInfo, "summary", uri);
        JSONArray tags = methodInfo.getJSONArray("tags");
        String tag = String.valueOf(tags.getFirst());
        Api api = new Api();
        api.setName(summary);
        api.setApplicationId(application.getId());
        api.setCategoryId(MapUtils.getLong(categoriesMappings, tag, 0L));
        api.setHasPathVariable(false);
        api.setUri("/" + serviceInstance.getServiceId() + uri);
        api.setMethod(method.toUpperCase());
        api.setAuthType(ApiAuthType.AUTHORIZATION_REQUIRED.name());
        api.setStatus(ApiStatusEnums.ENABLED.getValue());
        return api;
    }

    private Application getApplication(ApiSyncCommand cmd) {
        Long applicationId = cmd.getApplicationId();
        return applicationGateway.queryById(applicationId);
    }

    private ServiceInstance getServiceInstance(Application application) {
        ServiceInstance serviceInstance;
        try {
            List<ServiceInstance> instances = nacosServiceDiscovery.getInstances(application.getCode());
            Assert.notEmpty(instances, () -> ExceptionFactory.sysException("服务不在线,无法获取Api信息"));
            serviceInstance = instances.getFirst();
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
        try (HttpClient httpClient = HttpClient.newHttpClient()) {
            HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
            return JSON.parseObject(response.body());
        } catch (Exception e) {
            log.error("请求服务失败", e);
            throw ExceptionFactory.sysException("请求服务失败,请稍候重试");
        }
    }

}
