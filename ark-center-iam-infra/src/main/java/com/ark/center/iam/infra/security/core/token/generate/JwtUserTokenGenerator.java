package com.ark.center.iam.infra.security.core.token.generate;


import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.client.permission.response.LoginUserResponse;
import com.ark.center.iam.domain.user.support.SecurityConstants;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;

public class JwtUserTokenGenerator implements UserTokenGenerator {

    /**
     * 生成JWT令牌
     * withSubject  ：主题
     * withJWTId    ：JWT唯一ID
     * withExpiresAt：JWT的过期时间
     * withNotBefore：JWT生效时间
     * withIssuedAt ：JWT签发时间
     * @param userContext 用户上下文
     * @return Token
     */
    @Override
    public String generate(LoginUserResponse userContext) {
        LocalDateTime now = LocalDateTime.now();
        Instant nowInstant = now.atZone(ZoneId.systemDefault()).toInstant();
        return JWT.create()
                .withClaim("userCode", userContext.getUserCode())
                .withClaim("userId", userContext.getUserId())
                .withClaim("username", userContext.getUsername())
                .withClaim("isSuperAdmin", userContext.getIsSuperAdmin())
                .withSubject(userContext.getUsername())
                .withExpiresAt(now.plusSeconds(SecurityConstants.TOKEN_EXPIRES_SECONDS).atZone(ZoneId.systemDefault()).toInstant())
                .withNotBefore(nowInstant)
                .withIssuedAt(nowInstant)
                .withJWTId(StrUtil.uuid())
                .withIssuer("IAM")
                .withAudience("")
                .sign(Algorithm.HMAC256(SecurityConstants.JWT_SIGN_SECRET));
    }

}
