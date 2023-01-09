package com.ark.center.iam.data.user.support;

import cn.hutool.crypto.digest.DigestUtil;
import com.ark.center.iam.common.constants.SecurityConstants;
import org.springframework.stereotype.Component;

@Component
public class DefaultUserPasswordHelper implements IUserPasswordHelper {

    @Override
    public String enhancePassword(String password) {
        return DigestUtil.bcrypt(password + SecurityConstants.USER_SALT);
    }

    @Override
    public boolean checkPassword(String password, String passwordHashed) {
        return DigestUtil.bcryptCheck(password + SecurityConstants.USER_SALT, passwordHashed);
    }

    public static void main(String[] args) {
        String data = DigestUtil.md5Hex("88888888");
        System.out.println(data);
        String password = DigestUtil.md5Hex(data) + SecurityConstants.USER_SALT;
        System.out.println(password);
        // bcrypt
        final String bcrypt = DigestUtil.bcrypt(password);
        System.out.println(bcrypt);
        String inputPassword = DigestUtil.md5Hex(DigestUtil.md5Hex("88888888"));
        final boolean b = DigestUtil.bcryptCheck(inputPassword + SecurityConstants.USER_SALT, bcrypt);
        System.out.println(b);
    }
}
