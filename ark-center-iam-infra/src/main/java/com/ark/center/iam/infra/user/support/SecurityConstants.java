package com.ark.center.iam.infra.user.support;

/**
 * 安全变量
 */
public interface SecurityConstants {

    /**
     * 用户密码盐值
     */
    String PASSWORD_SALT = "6r4ogrp7th9rbyob";

    /**
     * TOKEN过期时间（秒）
     */
    int TOKEN_EXPIRES_SECONDS = 60 * 60 * 24 * 7;

    /**
     * JWT签名Secret
     */
    String JWT_SIGN_SECRET = "*$Y4F*$BdC4&tZJh";


}
