package com.ark.center.iam.infra.security.core.token.generate;


import com.ark.center.iam.client.permission.response.LoginUserResponse;

public interface UserTokenGenerator {

    String generate(LoginUserResponse userContext);
}
