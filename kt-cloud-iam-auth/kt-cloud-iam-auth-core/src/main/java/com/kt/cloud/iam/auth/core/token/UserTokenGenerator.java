package com.kt.cloud.iam.auth.core.token;

import com.kt.cloud.iam.auth.core.model.LoginUserDetails;

public interface UserTokenGenerator {

    String generate(LoginUserDetails loginUserDetails);

    String generate();
}
