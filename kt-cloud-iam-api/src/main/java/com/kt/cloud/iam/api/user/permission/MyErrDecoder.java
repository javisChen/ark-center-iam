package com.kt.cloud.iam.api.user.permission;

import feign.Response;
import feign.codec.ErrorDecoder;

public class MyErrDecoder implements ErrorDecoder {
    @Override
    public Exception decode(String s, Response response) {
        System.out.println("报错啦");
        return new Exception(response.reason());
    }
}
