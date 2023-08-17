package com.ark.center.iam.application.auth;

import cn.hutool.crypto.digest.DigestUtil;
import com.ark.center.iam.client.auth.command.AuthKickCmd;
import com.ark.center.iam.client.auth.command.AuthLoginCmd;
import com.ark.center.iam.client.auth.dto.AuthLoginDTO;
import com.ark.center.iam.client.permission.response.LoginUserResponse;
import com.ark.center.iam.domain.user.User;
import com.ark.center.iam.domain.user.gateway.UserGateway;
import com.ark.center.iam.domain.user.support.SecurityConstants;
import com.ark.center.iam.domain.user.support.UserConst;
import com.ark.center.iam.infra.security.core.token.cache.IUserTokenCacheService;
import com.ark.center.iam.infra.security.core.token.cache.UserCacheInfo;
import com.ark.component.dto.SingleResponse;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
@RequiredArgsConstructor
public class AuthAppService {

    private final IUserTokenCacheService iUserTokenCacheService;

    public void kick(AuthKickCmd cmd) {
        Long userId = cmd.getUserId();
        iUserTokenCacheService.remove(userId);
    }

}
