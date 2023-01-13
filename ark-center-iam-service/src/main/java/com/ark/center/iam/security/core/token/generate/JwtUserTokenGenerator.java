package com.ark.center.iam.security.core.token.generate;

import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.api.user.permission.response.LoginUserResponse;
import com.ark.center.iam.common.constants.SecurityConstants;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.impl.JWTParser;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Map;

public class JwtUserTokenGenerator implements UserTokenGenerator {

    @Override
    public String generate(LoginUserResponse userContext) {
        LocalDateTime now = LocalDateTime.now();
        Instant nowInstant = now.atZone(ZoneId.systemDefault()).toInstant();
        return JWT.create()
                .withClaim("userCode", userContext.getUserCode())
                .withClaim("userId", userContext.getUserId())
                .withClaim("username", userContext.getUsername())
                .withExpiresAt(now.plusSeconds(SecurityConstants.TOKEN_EXPIRES_SECONDS).atZone(ZoneId.systemDefault()).toInstant())
                .withNotBefore(nowInstant)
                .withIssuedAt(nowInstant)
                .withJWTId(StrUtil.uuid())
                .withIssuer("IAM")
                .sign(Algorithm.HMAC256(SecurityConstants.JWT_SIGN_SECRET));
    }

    public static void main(String[] args) {
        int tokenExpires = SecurityConstants.TOKEN_EXPIRES_SECONDS;
        System.out.println(tokenExpires);
        LocalDateTime temporal = LocalDateTime.now().plusSeconds(tokenExpires);
        String sign = JWT.create()
                .withClaim("userid", 1)//添加payload
                .withExpiresAt(temporal.atZone(ZoneId.systemDefault()).toInstant())
//                .withClaim("username", userDB.getUsername())
//                .withClaim("email", userDB.getEmail())
//                .withExpiresAt()//
//                .withAudience(loginUserDetails.getUserCode())
//                .withNotBefore(now) // 生效时间
//                .withIssuedAt(now) // 签发时间
                .withJWTId(StrUtil.uuid()) // 编号
                .withIssuer("IAM") // 签发人
                .sign(Algorithm.HMAC256(SecurityConstants.JWT_SIGN_SECRET));//设置签名 密钥
        DecodedJWT decode = JWT.decode(sign);
        String header = decode.getHeader();
        Map<String, Claim> claims = decode.getClaims();
        System.out.println(claims);
    }

//    @Override
//    public String generate(LoginUserDetails loginUserDetails) {
//        return createJwt(loginUserDetails);
//    }
//
//    @Override
//    public String generate() {
//        return null;
//    }
//
//    private String createJwt(LoginUserDetails loginUserDetails) {
//        Date now = new Date();
//        return JWT.create()
////                .withClaim("userid", userDB.getId())//添加payload
////                .withClaim("username", userDB.getUsername())
////                .withClaim("email", userDB.getEmail())
////                .withExpiresAt()//设置过期时间
//                .withAudience(loginUserDetails.getUserCode())
//                .withNotBefore(now) // 生效时间
//                .withIssuedAt(now) // 签发时间
//                .withJWTId(StrUtil.uuid()) // 编号
//                .withIssuer("IAM") // 签发人
//                .sign(Algorithm.HMAC256(secret));//设置签名 密钥
//
//    }
//
//    private Map<String, Object> createHeader() {
//        return null;
//    }
}
