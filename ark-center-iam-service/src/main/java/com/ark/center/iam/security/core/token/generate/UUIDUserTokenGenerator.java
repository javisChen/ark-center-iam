package com.ark.center.iam.security.core.token.generate;

import cn.hutool.core.util.IdUtil;
import com.ark.center.iam.api.user.permission.response.LoginUserResponse;

public class UUIDUserTokenGenerator implements UserTokenGenerator {

    @Override
    public String generate(LoginUserResponse userContext) {
        return IdUtil.fastSimpleUUID();
    }

}
