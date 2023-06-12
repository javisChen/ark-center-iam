package com.ark.center.iam.adapter.auth.web;


import com.ark.center.iam.application.auth.AuthAppService;
import com.ark.center.iam.client.auth.command.AuthLoginCmd;
import com.ark.center.iam.client.auth.dto.AuthLoginDTO;
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

    private final AuthAppService authAppService;

    /**
     * 账号登录
     */
    @PostMapping("/account")
    public SingleResponse<AuthLoginDTO> login(@RequestBody AuthLoginCmd authLoginDTO) {
        return authAppService.login(authLoginDTO);
    }

}

