package com.kt.upms.security.service;

import com.kt.upms.module.permission.service.IPermissionService;
import com.kt.upms.security.model.AuthenticationRequest;
import com.kt.upms.security.model.AuthenticationResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@Service
public class ApiAuthService implements IApiAuthService {

    @Autowired
    private IPermissionService iPermissionService;

    @Override
    public AuthenticationResponse auth(AuthenticationRequest request) {
        boolean hasPermission = iPermissionService
                .hasApiPermission(request.getApplication(), request.getUserId(), request.getUrl(), request.getMethod());
        return AuthenticationResponse.create(hasPermission);
    }
}