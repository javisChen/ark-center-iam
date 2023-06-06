package com.ark.center.iam.data.auth.controller;


import com.ark.center.iam.data.auth.service.IAuthService;
import com.ark.center.iam.data.auth.dto.AuthLoginReqDTO;
import com.ark.center.iam.data.auth.dto.AuthLoginRespDTO;
import com.ark.component.dto.SingleResponse;
import com.ark.component.web.base.BaseController;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 登录控制器
 * @author chengmo
 * @since 2020-11-09
 */
@RestController
@RequestMapping("/v1/login")
@RequiredArgsConstructor
public class LoginController extends BaseController {

    private final IAuthService iAuthService;

    /**
     * 账号登录
     */
    @PostMapping("/account")
    public SingleResponse<AuthLoginRespDTO> login(@RequestBody AuthLoginReqDTO authLoginDTO) {
        return iAuthService.login(authLoginDTO);
    }

}

