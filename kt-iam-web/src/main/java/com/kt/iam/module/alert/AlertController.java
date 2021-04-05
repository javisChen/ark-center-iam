package com.kt.iam.module.alert;


import com.alibaba.fastjson.JSONObject;
import com.kt.component.dto.ServerResponse;
import com.kt.component.web.base.BaseController;
import com.kt.iam.auth.core.SkipCheck;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * <p>
 * api表 前端控制器
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@RestController
@RequestMapping
@SkipCheck
@Slf4j
public class AlertController extends BaseController {


    @RequestMapping("/alert")
    @SkipCheck
    public ServerResponse list(@RequestBody JSONObject jsonObject) {
        System.out.println(jsonObject);
        return ServerResponse.ok();
    }


    @RequestMapping("/docker")
    @SkipCheck
    public ServerResponse docker(@RequestBody JSONObject jsonObject) throws UnknownHostException {
        log.info("request from " + getRequest().getRemoteAddr());
        InetAddress inetAddress= InetAddress.getLocalHost();
        log.info("you've hit " + inetAddress.getHostName());
        return ServerResponse.ok();
    }

}

