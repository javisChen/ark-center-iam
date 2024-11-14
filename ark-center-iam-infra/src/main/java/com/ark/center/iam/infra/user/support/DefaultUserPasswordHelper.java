package com.ark.center.iam.infra.user.support;

import cn.hutool.crypto.digest.DigestUtil;
import org.springframework.stereotype.Component;

@Component
public class DefaultUserPasswordHelper implements IUserPasswordHelper {

    /**
     * 密码加强策略，bcrypt(前端md5(md5(password)) + salt)
     */
    @Override
    public String enhancePassword(String password) {
        return DigestUtil.bcrypt(DigestUtil.md5Hex(password) + SecurityConstants.PASSWORD_SALT);
    }

    @Override
    public boolean checkPassword(String password, String passwordHashed) {
        return DigestUtil.bcryptCheck(password + SecurityConstants.PASSWORD_SALT, passwordHashed);
    }

    public static void main(String[] args) {
        String rawPassword = "88888888";
        String data = DigestUtil.md5Hex(rawPassword);
        System.out.println(data);
        String password = DigestUtil.md5Hex(data) + SecurityConstants.PASSWORD_SALT;
        System.out.println(password);
        // bcrypt
        final String bcrypt = DigestUtil.bcrypt(password);
        System.out.println(bcrypt);
        String inputPassword = DigestUtil.md5Hex(DigestUtil.md5Hex(rawPassword));
        final boolean b = DigestUtil.bcryptCheck(inputPassword + SecurityConstants.PASSWORD_SALT, bcrypt);
        System.out.println(b);
    }
}
