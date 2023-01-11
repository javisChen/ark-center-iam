package com.ark.center.iam.security.core.token.generate;

import com.ark.center.iam.api.user.permission.response.LoginUserResponse;

public interface UserTokenGenerator {

    String generate(LoginUserResponse userContext);
}
