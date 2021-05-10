package com.kt.cloud.iam.auth.core.token;

import cn.hutool.core.util.IdUtil;
import com.kt.cloud.iam.auth.core.model.LoginUserDetails;

public class UUIDUserTokenGenerator implements UserTokenGenerator {

    @Override
    public String generate(LoginUserDetails loginUserDetails) {
        return IdUtil.fastSimpleUUID();
    }

    @Override
    public String generate() {
        return IdUtil.fastSimpleUUID();
    }

}
