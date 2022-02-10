package com.kt.cloud.iam.security.access;

import com.kt.cloud.iam.api.user.permission.request.ApiAuthRequest;
import com.kt.cloud.iam.api.user.permission.response.ApiAuthResponse;
import com.kt.cloud.iam.module.api.cache.ApiCacheHolder;
import com.kt.cloud.iam.dao.entity.IamApplication;
import com.kt.cloud.iam.module.application.service.IApplicationService;
import com.kt.cloud.iam.module.user.service.IUserPermissionService;
import com.kt.cloud.iam.security.configuration.SecurityCoreProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class LocalAuthCheck extends AbstractAuthCheck {

    @Autowired
    private IUserPermissionService iUserPermissionService;

    public LocalAuthCheck(SecurityCoreProperties securityCoreProperties,
                          ApiCacheHolder apiCacheHolder,
                          IApplicationService iApplicationService) {
        super(securityCoreProperties, apiCacheHolder, iApplicationService);
    }

    @Override
    public ApiAuthResponse checkPermission(ApiAuthRequest apiAuthRequest) {
        String requestUri = apiAuthRequest.getRequestUri();
        String applicationCode = apiAuthRequest.getApplicationCode();
        String method = apiAuthRequest.getMethod();
        // 先尝试uri是否匹配系统中存在的包含路径参数的api，如果存在的话就替换成统一的格式
        requestUri = attemptReplaceHasPathVariableUrl(requestUri);

        // 尝试是否匹配默认设置不需要授权的api
        if (matchDefaultAllowUrl(requestUri)) {
            return ApiAuthResponse.success();
        }

        IamApplication application = getApplicationByCode(applicationCode);

        // 尝试是否匹配不需要授权的api
        if (checkUriIsNoNeedAuthorization(requestUri, method, application.getId())) {
            return ApiAuthResponse.success();
        }

        return iUserPermissionService.checkApiPermission(apiAuthRequest);
    }
}
