package com.kt.upms.security.access;

import com.kt.upms.security.model.AuthenticationRequest;
import com.kt.upms.security.model.AuthenticationResponse;
import com.kt.upms.security.service.IApiAuthService;
import com.kt.upms.security.token.UserTokenAuthenticationToken;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@Component
public class PermissionChecker implements InitializingBean {

    private final String ADMIN = "Admin";

    @Autowired
    private IApiAuthService iApiAuthService;

    private Map<String, String> map = new HashMap<>();

    public boolean check(HttpServletRequest request, Authentication authentication) {

        AuthenticationRequest authReq;
        String requestURI = request.getRequestURI();
        Long userId;
        if ("DEV".equals(request.getHeader("X-DEV-MODE"))) {
            userId = 1L;
        } else {
            UserTokenAuthenticationToken authenticationToken = (UserTokenAuthenticationToken) authentication;
            userId = authenticationToken.getUserId();
        }
//         Admin直接通过
        if (ADMIN.equals(authentication.getPrincipal())) {
            return true;
        }
        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (new AntPathMatcher().match(entry.getKey(), requestURI)) {
                requestURI = entry.getValue();
                break;
            }
        }
        authReq = createAuthenticationRequest(request, requestURI, userId);
        AuthenticationResponse authResp = iApiAuthService.auth(authReq);
        return authResp.getHasPermission();
    }

    private AuthenticationRequest createAuthenticationRequest(HttpServletRequest request, String requestURI, Long userId) {
        // 检查是否有权限
        AuthenticationRequest authReq = new AuthenticationRequest();
        authReq.setUserId(userId);
        authReq.setUrl(requestURI);
        authReq.setMethod(request.getMethod());
        authReq.setApplication("permission");
        return authReq;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        map.put("/upms/demo/hello/*/user/*", "/upms/hello/{id}/user/{sid}");
    }
}
