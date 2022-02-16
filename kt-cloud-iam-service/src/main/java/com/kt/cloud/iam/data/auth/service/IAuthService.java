package com.kt.cloud.iam.data.auth.service;

import com.kt.cloud.iam.data.auth.dto.AuthKickDTO;
import com.kt.cloud.iam.data.auth.dto.AuthLoginReqDTO;
import com.kt.cloud.iam.data.auth.dto.AuthLoginRespDTO;
import com.kt.component.dto.SingleResponse;

import javax.servlet.http.HttpServletRequest;

public interface IAuthService {

    void kick(AuthKickDTO dto);

    void logout(HttpServletRequest request);

    SingleResponse<AuthLoginRespDTO> login(AuthLoginReqDTO authLoginDTO);
}
