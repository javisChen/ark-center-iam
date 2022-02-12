package com.kt.cloud.iam.security.interceptor;

import com.kt.cloud.iam.security.configuration.AccessTokenProperties;
import com.kt.cloud.iam.security.core.token.cache.IUserTokenCacheService;
import com.kt.cloud.iam.security.exception.AuthenticationException;
import com.kt.component.context.token.AccessTokenExtractor;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 认证拦截器
 * @author jc
 */
@Component
public class AuthenticationInterceptor implements HandlerInterceptor {

    private final AccessTokenExtractor tokenExtractor;
    private final IUserTokenCacheService iUserTokenCacheService;
    private final AccessTokenProperties accessTokenProperties = new AccessTokenProperties();

    private final AuthenticationException tokenBlankException
            = AuthenticationException.of("403", "AUTHENTICATION FAILED: [TOKEN CANNOT BE BLANK]");

    private final AuthenticationException tokenInvalidException
            = AuthenticationException.of("403", "AUTHENTICATION FAILED: [TOKEN IS INVALID]");

    public AuthenticationInterceptor(AccessTokenExtractor tokenExtractor,
                                     IUserTokenCacheService iUserTokenCacheService) {
        this.tokenExtractor = tokenExtractor;
        this.iUserTokenCacheService = iUserTokenCacheService;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        iUserTokenCacheService.get()
        return true;
//        String accessToken = tokenExtractor.extract(request, accessTokenProperties);
//        Assert.isTrue(StringUtils.isBlank(accessToken), tokenBlankException);
//
//        LoginUserContext userDetails = IUserTokenCacheService.get(accessToken);
//        Assert.isTrue(Objects.isNull(userDetails), tokenInvalidException);
//
//        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }

}
