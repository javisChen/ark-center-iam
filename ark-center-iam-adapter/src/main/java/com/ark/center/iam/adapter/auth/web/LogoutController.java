package com.ark.center.iam.adapter.auth.web;


import com.ark.center.iam.application.auth.AuthAppService;
import com.ark.center.iam.client.auth.command.AuthKickCmd;
import com.ark.component.dto.ServerResponse;
import com.ark.component.web.base.BaseController;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 登出控制器
 * @author chengmo
 * @since 2020-11-09
 */
@RestController
@RequestMapping
@RequiredArgsConstructor
public class LogoutController extends BaseController {

    private final AuthAppService authAppService;

    /**
     * 登出
     */
    @PostMapping("/v1/logout")
    public ServerResponse logout() {
        authAppService.logout(getRequest());
        return ServerResponse.ok();
    }

    /**
     * 踢出（强制用户下线）
     */
    @PostMapping("/v1/kick")
    public ServerResponse kick(@RequestBody AuthKickCmd dto) {
        authAppService.kick(dto);
        return ServerResponse.ok();
    }
}

