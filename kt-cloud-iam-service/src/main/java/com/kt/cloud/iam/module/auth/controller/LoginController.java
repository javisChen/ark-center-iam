package com.kt.cloud.iam.module.auth.controller;


import com.kt.cloud.iam.module.auth.dto.AuthLoginReqDTO;
import com.kt.cloud.iam.module.auth.dto.AuthLoginRespDTO;
import com.kt.cloud.iam.module.auth.service.IAuthService;
import com.kt.component.dto.SingleResponse;
import com.kt.component.web.base.BaseController;
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
public class LoginController extends BaseController {

    private final IAuthService iAuthService;

    public LoginController(IAuthService iAuthService) {
        this.iAuthService = iAuthService;
    }

    /**
     * 账号登录
     */
    @PostMapping("/account")
    public SingleResponse<AuthLoginRespDTO> login(@RequestBody AuthLoginReqDTO authLoginDTO) {
        return iAuthService.login(authLoginDTO);
    }

}

