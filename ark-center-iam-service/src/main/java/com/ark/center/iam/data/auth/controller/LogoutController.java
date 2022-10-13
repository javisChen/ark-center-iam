package com.ark.center.iam.data.auth.controller;


import com.ark.center.iam.data.auth.dto.AuthKickDTO;
import com.ark.center.iam.data.auth.service.IAuthService;
import com.ark.component.dto.ServerResponse;
import com.ark.component.web.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping()
public class LogoutController extends BaseController {

    @Autowired
    private IAuthService iAuthService;

    /**
     * 登出
     */
    @PostMapping("/v1/logout")
    public ServerResponse logout() {
        iAuthService.logout(getRequest());
        return ServerResponse.ok();
    }

    /**
     * 踢出（强制用户下线）
     */
    @PostMapping("/v1/kick")
    public ServerResponse kick(@RequestBody AuthKickDTO dto) {
        iAuthService.kick(dto);
        return ServerResponse.ok();
    }
}

