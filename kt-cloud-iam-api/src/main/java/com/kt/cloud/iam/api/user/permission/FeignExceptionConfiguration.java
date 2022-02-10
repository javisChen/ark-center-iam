package com.kt.cloud.iam.api.user.permission;

import feign.codec.ErrorDecoder;
import org.springframework.context.annotation.Bean;

public class FeignExceptionConfiguration {

    @Bean

    public ErrorDecoder errorDecoder(){

        return new MyErrDecoder();

    }

}
