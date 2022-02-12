//package com.kt.cloud.iam.security.core.check;
//
//import cn.hutool.http.HttpUtil;
//import com.alibaba.fastjson.JSONObject;
//import com.kt.cloud.iam.api.user.permission.request.ApiAuthRequest;
//import com.kt.cloud.iam.api.user.permission.response.ApiAuthResponse;
//import com.kt.cloud.iam.security.configuration.AccessTokenProperties;
//import com.kt.cloud.iam.security.config.AuthProperties;
//import com.kt.cloud.iam.security.core.context.LoginUserContextHolder;
//import com.kt.cloud.iam.security.core.token.extractor.DefaultTokenExtractor;
//import com.kt.cloud.iam.security.core.token.extractor.TokenExtractor;
//import com.kt.component.dto.ServerResponse;
//import lombok.extern.slf4j.Slf4j;
//import org.apache.commons.lang3.StringUtils;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.MediaType;
//import org.springframework.util.AntPathMatcher;
//import org.springframework.web.filter.GenericFilterBean;
//
//import javax.servlet.FilterChain;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.List;
//
//@Slf4j
//public class AuthCheckFilter extends GenericFilterBean {
//
//    private TokenExtractor tokenExtractor = new DefaultTokenExtractor();
//    private AccessTokenProperties accessTokenProperties = new AccessTokenProperties();
//    private AuthProperties authProperties;
//    private List<String> allowList;
//    private AntPathMatcher pathMatcher = new AntPathMatcher();
//
//    public AuthCheckFilter(AuthProperties authProperties, List<String> allowList) {
//        this.authProperties = authProperties;
//        this.allowList = allowList;
//    }
//
//    @Override
//    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
//            throws IOException, ServletException {
//        HttpServletRequest request = (HttpServletRequest) req;
//        HttpServletResponse response = (HttpServletResponse) res;
//        response.setContentType(MediaType.APPLICATION_JSON_VALUE);
//
//        logDebug("Auth Filter：Processing Auth Check......");
//
//        // 检查下当前接口是否不走权限中心
//        if (matchNoPermission(request)) {
//            LoginUserContextHolder.setContext(null);
//            chain.doFilter(request, response);
//            return;
//        }
//
//        ApiAuthResponse authResponse = requestCheckPermission(request);
//        if (authResponse.getHasPermission()) {
//            logDebug("Auth Filter：Check Result： Pass");
//            LoginUserContextHolder.setContext(authResponse.getCurrentUser());
//            chain.doFilter(request, response);
//            return;
//        }
//
//        logDebug( "Auth Filter：Check Result： Fail, Reason：{}", authResponse.getMsg());
//        responseFail(response, HttpStatus.FORBIDDEN, authResponse.getCode(), authResponse.getMsg());
//    }
//
//    private boolean matchNoPermission(HttpServletRequest request) {
//        return allowList.stream().anyMatch(item -> pathMatcher.match(item, createKey(request)));
//    }
//
//    private String createKey(HttpServletRequest request) {
//        return request.getMethod() + ":" + request.getServletPath();
//    }
//
//    private void responseFail(HttpServletResponse response, HttpStatus httpStatus, String code, String msg) throws IOException {
//        response.setStatus(httpStatus.value());
//        JSONObject.writeJSONString(response.getOutputStream(), ServerResponse.error(code, msg));
//    }
//
//    /**
//     * 请求权限中心
//     */
//    private ApiAuthResponse requestCheckPermission(HttpServletRequest request) {
//        ApiAuthRequest authRequest = createAuthRequest(request);
//
//        String body = JSONObject.toJSONString(authRequest);
//        String authResponseBody = null;
//        try {
//            authResponseBody = HttpUtil.post(authProperties.getServerUrl(), body, authProperties.getTimeout());
//        } catch (Exception e) {
//            log.error("统一认证服务请求失败", e);
//            return ApiAuthResponse.fail("Auth Server Error：" + e.getMessage());
//        }
//        if (StringUtils.isBlank(authResponseBody)) {
//            return ApiAuthResponse.fail("Auth Server Error：Unknown Error");
//        }
//
//        ApiAuthResponse authResponse = JSONObject.parseObject(authResponseBody, ApiAuthResponse.class);
//        logDebug( "Receive Auth Result -----> {}", authResponse);
//        return authResponse;
//    }
//
//    private ApiAuthRequest createAuthRequest(HttpServletRequest request) {
//        String token = tokenExtractor.extract(request, accessTokenProperties);
//        ApiAuthRequest authRequest = new ApiAuthRequest();
//        authRequest.setRequestUri(request.getRequestURI());
//        authRequest.setMethod(request.getMethod());
//        authRequest.setAccessToken(token);
//        authRequest.setApplicationCode(authProperties.getApplicationCode());
//        return authRequest;
//    }
//
//    private void logDebug(String s, Object... o) {
//        if (log.isDebugEnabled()) {
//            log.debug(s, o);
//        }
//    }
//
//}
