package com.kt.cloud.iam.identity.access;

import com.kt.cloud.iam.api.access.request.ApiAccessRequest;
import com.kt.cloud.iam.api.access.response.ApiAccessResponse;
import com.kt.cloud.iam.api.access.response.UserResponse;
import com.kt.cloud.iam.api.user.permission.response.LoginUserResponse;
import com.kt.cloud.iam.data.api.cache.ApiCacheHolder;
import com.kt.cloud.iam.data.api.support.ApiCommonUtils;
import com.kt.cloud.iam.data.application.service.IApplicationService;
import com.kt.cloud.iam.data.user.service.IUserPermissionService;
import com.kt.cloud.iam.security.configuration.SecurityCoreProperties;
import com.kt.cloud.iam.security.core.token.cache.IUserTokenCacheService;
import com.kt.cloud.iam.security.exception.AuthenticationException;
import com.kt.cloud.iam.security.exception.AuthorizationException;
import com.kt.component.common.ParamsChecker;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.collections4.MapUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.AntPathMatcher;

import java.util.List;
import java.util.Map;

@Service
public class AccessService {

    private final SecurityCoreProperties securityCoreProperties;
    private final AntPathMatcher pathMatcher = new AntPathMatcher();
    private final ApiCacheHolder apiCacheHolder;
    private final IApplicationService iApplicationService;
    private final IUserPermissionService iUserPermissionService;
    private final IUserTokenCacheService iUserTokenCacheService;

    private final AuthenticationException tokenBlankException
            = AuthenticationException.of("authentication failed: [token cannot be blank]");
    private final AuthenticationException tokenInvalidException
            = AuthenticationException.of("authentication failed: [token is invalid or expired]");
    private final AuthorizationException accessDeniedException
            = AuthorizationException.of("authorization failed: [access is denied]");

    public AccessService(IUserPermissionService iUserPermissionService,
                         SecurityCoreProperties securityCoreProperties,
                         ApiCacheHolder apiCacheHolder,
                         IApplicationService iApplicationService,
                         IUserTokenCacheService iUserTokenCacheService) {
        this.apiCacheHolder = apiCacheHolder;
        this.iApplicationService = iApplicationService;
        this.iUserPermissionService = iUserPermissionService;
        this.securityCoreProperties = securityCoreProperties;
        this.iUserTokenCacheService = iUserTokenCacheService;
    }

    public ApiAccessResponse getApiAccess(ApiAccessRequest apiAccessRequest) {

        String requestUri = apiAccessRequest.getRequestUri();
        String applicationCode = apiAccessRequest.getApplicationCode();
        String method = apiAccessRequest.getHttpMethod();
        // 先尝试uri是否匹配系统中存在的包含路径参数的api，如果存在的话就替换成统一的格式
        requestUri = attemptReplaceHasPathVariableUrl(requestUri);

        // 尝试是否匹配白名单中的uri
        if (isMatchDefaultAllowUrl(requestUri)) {
            return ApiAccessResponse.success();
        }

        // 检查Token是否存在
        String accessToken = apiAccessRequest.getAccessToken();
        checkAccessTokenIsEmpty(accessToken);

        // 检查登录用户缓存
        LoginUserResponse userContext = iUserTokenCacheService.get(accessToken);
        checkLoginUser(userContext);

        // 检查API是否只需认证
        if (isMatchJustNeedAuthenticationUri(requestUri, method)) {
            return ApiAccessResponse.success();
        }

        // 检查API是否需要授权
        if (isMatchNoNeedAuthorizationUri(requestUri, method)) {
            return ApiAccessResponse.success();
        }

        // 检查是否有API访问权
        checkHasApiAccess(requestUri, applicationCode, method, userContext.getUserCode());

        return ApiAccessResponse.success(convertToUserResponse(userContext));
    }

    private void checkHasApiAccess(String requestUri, String applicationCode, String method, String userCode) {
        boolean hasApiPermission = iUserPermissionService.checkHasApiPermission(applicationCode, userCode, requestUri, method);
        ParamsChecker.throwIfIsTrue(!hasApiPermission, accessDeniedException);
    }

    private void checkLoginUser(LoginUserResponse userContext) {
        ParamsChecker.throwIfIsNull(userContext, tokenInvalidException);
    }

    private void checkAccessTokenIsEmpty(String accessToken) {
        ParamsChecker.throwIfIsEmpty(accessToken, tokenBlankException);
    }

    private UserResponse convertToUserResponse(LoginUserResponse userContext) {
        UserResponse userResponse = new UserResponse();
        userResponse.setUserId(userContext.getUserId());
        userResponse.setUserCode(userContext.getUserCode());
        userResponse.setUsername(userContext.getUsername());
        userResponse.setAccessToken(userContext.getAccessToken());
        userResponse.setExpires(userContext.getExpires());
        userResponse.setIsSuperAdmin(userContext.getIsSuperAdmin());
        return userResponse;
    }

    public boolean isMatchDefaultAllowUrl(String requestUri) {
        List<String> allowList = securityCoreProperties.getAllowList();
        if (CollectionUtils.isEmpty(allowList)) {
            return false;
        }
        return allowList.stream()
                .anyMatch(item -> pathMatcher.match(item, requestUri));
    }

    public String attemptReplaceHasPathVariableUrl(String requestUri) {
        List<String> hasPathVariableApiCache = apiCacheHolder.getHasPathVariableApiCache();
        return hasPathVariableApiCache.stream()
                .filter(item -> pathMatcher.match(item, requestUri))
                .findFirst()
                .orElse(requestUri);
    }

    /**
     * 尝试匹配无需授权的资源
     * 系统的无需授权资源 + 配置上的定义
     * @return 匹配成功=true，不成功=false
     */
    public boolean isMatchNoNeedAuthorizationUri(String requestUri, String method) {
        Map<String, String> cache = apiCacheHolder.getNoNeedAuthorizationApiCache();
        return isMatchUri(cache, requestUri, method);
    }

    /**
     * 尝试匹配无需认证的资源
     * 系统的无需授权资源 + 配置上的定义
     * @return 匹配成功=true，不成功=false
     */
    public boolean isMatchJustNeedAuthenticationUri(String requestUri, String method) {
        Map<String, String> cache = apiCacheHolder.getNoNeedAuthenticationApiCache();
        return isMatchUri(cache, requestUri, method);
    }

    private boolean isMatchUri(Map<String, String> cache, String requestUri, String method) {
        if (MapUtils.isEmpty(cache)) {
            return false;
        }
        return cache.get(ApiCommonUtils.createKey(requestUri, method)) != null;
    }

}
