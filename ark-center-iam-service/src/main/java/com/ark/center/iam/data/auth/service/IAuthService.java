package com.ark.center.iam.data.auth.service;

import com.ark.center.iam.data.auth.dto.AuthKickDTO;
import com.ark.center.iam.data.auth.dto.AuthLoginReqDTO;
import com.ark.center.iam.data.auth.dto.AuthLoginRespDTO;
import com.ark.component.dto.SingleResponse;

import jakarta.servlet.http.HttpServletRequest;

public interface IAuthService {

    void kick(AuthKickDTO dto);

    void logout(HttpServletRequest request);

    SingleResponse<AuthLoginRespDTO> login(AuthLoginReqDTO authLoginDTO);
}
