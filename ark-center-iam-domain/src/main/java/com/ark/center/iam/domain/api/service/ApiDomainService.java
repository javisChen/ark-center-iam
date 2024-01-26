package com.ark.center.iam.domain.api.service;

import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.gateway.ApiGateway;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ApiDomainService {

    private final ApiGateway apiGateway;

    public Api create() {

    }
}
