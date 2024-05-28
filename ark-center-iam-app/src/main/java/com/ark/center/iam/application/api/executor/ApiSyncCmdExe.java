package com.ark.center.iam.application.api.executor;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.lang.Assert;
import com.alibaba.cloud.nacos.discovery.NacosServiceDiscovery;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.alibaba.nacos.api.exception.NacosException;
import com.ark.center.iam.client.api.command.ApiSyncCmd;
import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.ApiCategory;
import com.ark.center.iam.domain.api.gateway.ApiCategoryGateway;
import com.ark.center.iam.domain.api.gateway.ApiGateway;
import com.ark.center.iam.domain.application.Application;
import com.ark.center.iam.domain.application.gateway.ApplicationGateway;
import com.ark.center.iam.domain.enums.ApiAuthTypeEnums;
import com.ark.center.iam.domain.enums.ApiStatusEnums;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.service.PermissionService;
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

import java.io.FileNotFoundException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Component
@Slf4j
public class ApiSyncCmdExe {

    private final ApplicationGateway applicationGateway;

    private final ApiGateway apiGateway;

    private final ApiCategoryGateway apiCategoryGateway;

    private final NacosServiceDiscovery nacosServiceDiscovery;

    private final PermissionService permissionService;

    public void execute(ApiSyncCmd cmd) {

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
        List<ApiCategory> existsCategories = apiCategoryGateway.selectByApplicationId(application.getId());
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
                .forEach(apiCategoryGateway::insert);
        return apiCategoryGateway.selectByApplicationId(application.getId());
    }

    /**
     * 提取所有的Tag
     */
    private List<String> extractTags(JSONObject openAPI) {
//        JSONArray tags = openAPI.getJSONArray("tags");
//        if (CollectionUtils.isEmpty(tags)) {
//            return Collections.emptyList();
//        }
//        return tags.stream()
//                .map(item -> (JSONObject) item)
//                .map(item -> item.getString("name"))
//                .toList();

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
            apiGateway.insert(api);
            permissionService.addPermission(api.getId(), PermissionType.SER_API);
        }

        for (Api api : updateApis) {
            apiGateway.updateByApiId(api);
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
        List<Api> existingApis = apiGateway.selectByApplicationId(application.getId());
        MultiKeyMap<String, Api> map = new MultiKeyMap<>();
        for (Api existingApi : existingApis) {
            map.put(createApiMultiKey(existingApi), existingApi);
        }
        return map;
    }

    public static void main(String[] args) throws FileNotFoundException {

//        JSONArray jsonObject = JSON.parseArray(IoUtil.readBytes(new FileInputStream("C:\\Code\\ark\\ark-center-iam\\json.json")));
//        List<Object> bisValid = jsonObject.stream().filter(item -> {
//            JSONObject object = (JSONObject) item;
//            boolean bisValid1 = object.getInteger("bisValid").equals(1)
//                    && object.getString("erpTradeOuterId").equals("52CB0C8D-4606-4BC3-80E8-91A6731D4051");
//            return bisValid1;
//        }).collect(Collectors.toList());
//        System.out.println(JSON.toJSONString(bisValid, JSONWriter.Feature.PrettyFormat));
//
//        List<Api> insertList = new ArrayList<>();
//        Api a1 = new Api();
//        a1.setName("api1");
//        a1.setUri("/users1");
//        a1.setMethod("get");
//
//        Api a2 = new Api();
//        a2.setName("api2");
//        a2.setUri("/users");
//        a2.setMethod("post");
//        insertList.add(a1);
//        insertList.add(a2);
//
//        List<Api> customerInsertList = insertList.stream().
//                collect(Collectors.collectingAndThen(Collectors.toCollection(
//                        () -> new TreeSet<>(Comparator.comparing(Api::getUri))), ArrayList::new));
////
//        System.out.println(customerInsertList.size());

        List<Api> existingApis = new ArrayList<>();
        Api a1 = new Api();
        a1.setName("api1");
        a1.setUri("/users");
        a1.setMethod("get");

        Api a2 = new Api();
        a2.setName("api2");
        a2.setUri("/users");
        a2.setMethod("post");
        existingApis.add(a2);
        MultiKeyMap<String, Api> collect = existingApis.stream()
                .collect(Collector.of(MultiKeyMap::new,
                        (map, api) -> map.put(api.getUri(), api.getMethod(), api),
                        (map1, map2) -> {
                            map1.putAll(map2);
                            return map1;
                        },
                        Function.identity()
                ));
        System.out.println(collect);
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
        String tag = String.valueOf(tags.get(0));
        Api api = new Api();
        api.setName(summary);
        api.setApplicationId(application.getId());
        api.setCategoryId(MapUtils.getLong(categoriesMappings, tag, 0L));
        api.setHasPathVariable(false);
        api.setUri("/" + serviceInstance.getServiceId() + uri);
        api.setMethod(method.toUpperCase());
        api.setAuthType(ApiAuthTypeEnums.NEED_AUTHENTICATION_AND_AUTHORIZATION.getValue());
        api.setStatus(ApiStatusEnums.ENABLED.getValue());
        return api;
    }

    private Application getApplication(ApiSyncCmd cmd) {
        Long applicationId = cmd.getApplicationId();
        return applicationGateway.queryById(applicationId);
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
