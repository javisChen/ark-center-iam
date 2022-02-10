package com.kt.cloud.iam.module.user.support;

import cn.hutool.crypto.digest.DigestUtil;
import com.kt.cloud.iam.common.constants.IamConsts;
import org.springframework.stereotype.Component;

@Component
public class DefaultUserPasswordHelper implements IUserPasswordHelper {

    @Override
    public String enhancePassword(String password) {
        return DigestUtil.bcrypt(password + IamConsts.USER_SALT);
    }

    @Override
    public boolean checkPassword(String password, String passwordHashed) {
        return DigestUtil.bcryptCheck(password + IamConsts.USER_SALT, passwordHashed);
    }

    public static void main(String[] args) {
        String data = DigestUtil.md5Hex("88888888");
        System.out.println(data);
        String password = DigestUtil.md5Hex(data) + IamConsts.USER_SALT;
        System.out.println(password);
        // bcrypt
        final String bcrypt = DigestUtil.bcrypt(password);
        System.out.println(bcrypt);
        String inputPassword = DigestUtil.md5Hex(DigestUtil.md5Hex("88888888"));
        final boolean b = DigestUtil.bcryptCheck(inputPassword + IamConsts.USER_SALT, bcrypt);
        System.out.println(b);
    }
}
