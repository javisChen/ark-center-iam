package com.kt.cloud.iam.module.access;

import com.kt.cloud.iam.api.access.request.ApiAccessRequest;
import com.kt.cloud.iam.api.access.response.ApiAccessResponse;
import com.kt.cloud.iam.api.access.response.UserResponse;
import com.kt.cloud.iam.api.user.permission.response.LoginUserContext;
import com.kt.cloud.iam.common.util.Assert;
import com.kt.cloud.iam.dao.entity.IamApplication;
import com.kt.cloud.iam.module.api.cache.ApiCacheHolder;
import com.kt.cloud.iam.module.application.service.IApplicationService;
import com.kt.cloud.iam.module.user.service.IUserPermissionService;
import com.kt.cloud.iam.security.configuration.SecurityCoreProperties;
import com.kt.cloud.iam.security.core.token.cache.IUserTokenCacheService;
import com.kt.cloud.iam.security.exception.AuthenticationException;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.collections4.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.AntPathMatcher;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@Service
public class AccessService {

    private final SecurityCoreProperties securityCoreProperties;
    private final AntPathMatcher pathMatcher = new AntPathMatcher();
    private final ApiCacheHolder apiCacheHolder;
    private final IApplicationService iApplicationService;
    private final IUserPermissionService iUserPermissionService;
    private final IUserTokenCacheService iUserTokenCacheService;

    private final AuthenticationException tokenBlankException
            = AuthenticationException.of("401", "AUTHENTICATION FAILED: [TOKEN CANNOT BE BLANK]");
    private final AuthenticationException tokenInvalidException
            = AuthenticationException.of("401", "AUTHENTICATION FAILED: [TOKEN IS INVALID]");

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
        if (matchDefaultAllowUrl(requestUri)) {
            return ApiAccessResponse.success();
        }
//        IamApplication application = getApplicationByCode(applicationCode);
//        // 尝试是否匹配不需要授权的api
//        if (checkUriIsNoNeedAuthorization(requestUri, method, application.getId())) {
//            return ApiAccessResponse.success();
//        }

        LoginUserContext userContext = null;
        try {
            userContext = attemptGetUserCache(apiAccessRequest.getAccessToken());
        } catch (AuthenticationException e) {
            return ApiAccessResponse.fail(e.getErrCode(), e.getMessage());
        }
        boolean hasApiPermission = iUserPermissionService.checkHasApiPermission(applicationCode, userContext.getUserCode(), requestUri, method);
        if (!hasApiPermission) {
            return ApiAccessResponse.fail();
        }
        UserResponse userResponse = convertToUserResponse(userContext);
        return ApiAccessResponse.success(userResponse);
    }

    private UserResponse convertToUserResponse(LoginUserContext userContext) {
        UserResponse userResponse = new UserResponse();
        userResponse.setUserId(userContext.getUserId());
        userResponse.setUserCode(userContext.getUserCode());
        userResponse.setUsername(userContext.getUsername());
        userResponse.setAccessToken(userContext.getAccessToken());
        userResponse.setExpires(userContext.getExpires());
        userResponse.setIsSuperAdmin(userContext.getIsSuperAdmin());
        return userResponse;
    }

    private LoginUserContext attemptGetUserCache(String accessToken) {
        Assert.isTrue(StringUtils.isBlank(accessToken), tokenBlankException);
        LoginUserContext userDetails = iUserTokenCacheService.get(accessToken);
        Assert.isTrue(Objects.isNull(userDetails), tokenInvalidException);
        return userDetails;
    }

    public boolean matchDefaultAllowUrl(String requestUri) {
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

    private String createKey(String url, String method, Long applicationId) {
        return url + ":" + method + ":" + applicationId;
    }

    /**
     * 尝试匹配无需授权的资源
     * @return 匹配成功=true，不成功=false
     */
    public boolean checkUriIsNoNeedAuthorization(String url, String method, Long applicationId) {
        Map<String, String> noNeedAuthorizationApiCache = apiCacheHolder.getNoNeedAuthorizationApiCache();
        if (MapUtils.isEmpty(noNeedAuthorizationApiCache)) {
            return false;
        }
        return noNeedAuthorizationApiCache.get(createKey(url, method, applicationId)) != null;
    }

    public IamApplication getApplicationByCode(String applicationCode) {
        return iApplicationService.getApplicationByCode(applicationCode);
    }

}
