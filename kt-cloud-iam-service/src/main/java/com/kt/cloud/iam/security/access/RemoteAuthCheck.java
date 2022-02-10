package com.kt.cloud.iam.security.access;

import com.kt.cloud.iam.api.user.permission.request.ApiAuthRequest;
import com.kt.cloud.iam.api.user.permission.response.ApiAuthResponse;
import com.kt.cloud.iam.api.user.permission.response.LoginUserContext;
import com.kt.component.dto.ResponseEnums;
import com.kt.cloud.iam.security.core.token.cache.IUserTokenCacheService;
import com.kt.cloud.iam.module.api.cache.ApiCacheHolder;
import com.kt.cloud.iam.dao.entity.IamApplication;
import com.kt.cloud.iam.module.application.service.IApplicationService;
import com.kt.cloud.iam.module.user.service.IUserPermissionService;
import com.kt.cloud.iam.security.configuration.SecurityCoreProperties;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RemoteAuthCheck extends AbstractAuthCheck {

    @Autowired
    private IUserPermissionService iUserPermissionService;
    @Autowired
    private IUserTokenCacheService iUserTokenCacheService;

    public RemoteAuthCheck(SecurityCoreProperties securityCoreProperties,
                           ApiCacheHolder apiCacheHolder,
                           IApplicationService iApplicationService) {
        super(securityCoreProperties, apiCacheHolder, iApplicationService);
    }

    private boolean doCheck(ApiAuthRequest request) {
        boolean result = false;
        boolean accessToken = StringUtils.isNotBlank(request.getAccessToken());
        boolean url = StringUtils.isNotBlank(request.getRequestUri());
        boolean method = StringUtils.isNotBlank(request.getMethod());
        boolean applicationCode = StringUtils.isNotBlank(request.getApplicationCode());
        if (accessToken && url && method && applicationCode) {
            result = true;
        }
        return result;
    }

    @Override
    public ApiAuthResponse checkPermission(ApiAuthRequest authRequest) {
        boolean checkResult = doCheck(authRequest);
        if (!checkResult) {
            return ApiAuthResponse.fail("Request is invalid");
        }
        String requestUri = authRequest.getRequestUri();
        String applicationCode = authRequest.getApplicationCode();
        String method = authRequest.getMethod();
        String accessToken = authRequest.getAccessToken();
        IamApplication application = getApplicationByCode(applicationCode);
        if (application == null) {
            return ApiAuthResponse.fail("Application not exists");
        }
        requestUri = attemptReplaceHasPathVariableUrl(requestUri);
        // 检查是否需要认证，如果需要的话检查token合法性
        Long applicationId = application.getId();
        if (checkUriIsNoNeedAuthentication(requestUri, method, applicationId)) {
            return ApiAuthResponse.success();
        }
        if (StringUtils.isBlank(accessToken)) {
            return ApiAuthResponse.fail(ResponseEnums.USER_AUTHENTICATION_FAIL.getMsg());
        }
        LoginUserContext userContext = iUserTokenCacheService.get(accessToken);
        if (userContext == null) {
            return ApiAuthResponse.fail(ResponseEnums.USER_AUTHENTICATION_FAIL.getMsg());
        }

        if (checkUriIsNoNeedAuthorization(requestUri, method, applicationId)) {
            return ApiAuthResponse.success(userContext);
        }

        fillAuthRequest(authRequest, userContext);
        ApiAuthResponse authResponse = iUserPermissionService.checkApiPermission(authRequest);
        authResponse.setLoginUserContext(userContext);
        return authResponse;
    }

    private void fillAuthRequest(ApiAuthRequest authReq, LoginUserContext userContext) {
        authReq.setUserCode(userContext.getUserCode());
        authReq.setUserId(userContext.getUserId());
    }

    private ApiAuthRequest createAuthenticationRequest(String method, String requestUri, LoginUserContext userContext,
                                                       String applicationCode) {
        ApiAuthRequest authReq = new ApiAuthRequest();
        authReq.setUserCode(userContext.getUserCode());
        authReq.setUserId(userContext.getUserId());
        authReq.setRequestUri(requestUri);
        authReq.setMethod(method);
        authReq.setApplicationCode(applicationCode);
        return authReq;
    }
}
