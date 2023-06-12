package com.ark.center.iam.application.api.cache;

import com.ark.center.iam.application.api.support.ApiCommonUtils;
import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.client.api.query.ApiQry;
import com.ark.center.iam.domain.api.gateway.ApiGateway;
import com.ark.center.iam.domain.enums.ApiAuthTypeEnums;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Api缓存
 */
@Component
public class ApiCacheHolder implements InitializingBean {

    @Autowired
    private ApiGateway apiGateway;

    /**
     * 无需授权api缓存
     */
    private Map<String, String> noNeedAuthorizationApiCache;

    /**
     * 无需认证api缓存
     */
    private Map<String, String> noNeedAuthenticationApiCache;

    /**
     * 包含路径参数的api缓存
     */
    private List<String> hasPathVariableApiCache;

    public void init() {
        List<ApiDetailsDTO> apis = apiGateway.selectList(new ApiQry());
        noNeedAuthorizationApiCache = filterNoNeedAuthorizationApis(apis);
        noNeedAuthenticationApiCache = filterNoNeedAuthenticationApis(apis);
        hasPathVariableApiCache = filterHasPathVariableApis(apis);
    }

    private Map<String, String> filterNoNeedAuthorizationApis(List<ApiDetailsDTO> apis) {
        return apis.stream()
                .filter(item -> item.getAuthType().equals(ApiAuthTypeEnums.NEED_AUTHENTICATION.getValue())
                        || item.getAuthType().equals(ApiAuthTypeEnums.NO_AUTHENTICATION_AND_AUTHORIZATION.getValue()))
                .collect(Collectors.toMap(api -> ApiCommonUtils.createKey(api.getUrl(), api.getMethod()), ApiDetailsDTO::getUrl));
    }

    private Map<String, String> filterNoNeedAuthenticationApis(List<ApiDetailsDTO> apis) {
        return apis.stream()
                .filter(item -> item.getAuthType().equals(ApiAuthTypeEnums.NEED_AUTHENTICATION.getValue()))
                .collect(Collectors.toMap(api -> ApiCommonUtils.createKey(api.getUrl(), api.getMethod()), ApiDetailsDTO::getUrl));
    }

    private List<String> filterHasPathVariableApis(List<ApiDetailsDTO> apis) {
        return apis.stream()
                .filter(item -> item.getHasPathVariable().equals(true))
                .map(ApiDetailsDTO::getUrl)
                .collect(Collectors.toList());
    }

    public Map<String, String> getNoNeedAuthorizationApiCache() {
        return noNeedAuthorizationApiCache;
    }

    public Map<String, String> getNoNeedAuthenticationApiCache() {
        return noNeedAuthenticationApiCache;
    }

    public List<String> getHasPathVariableApiCache() {
        return hasPathVariableApiCache;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        init();
    }

    public void update() {
        init();
    }
}
