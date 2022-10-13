package com.ark.center.iam.security.core.token.generate;

import cn.hutool.core.util.IdUtil;

public class UUIDUserTokenGenerator implements UserTokenGenerator {

    @Override
    public String generate() {
        return IdUtil.fastSimpleUUID();
    }

}
