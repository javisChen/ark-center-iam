package com.kt.cloud.iam.module.alert;


import com.alibaba.fastjson.JSONObject;
import com.kt.cloud.iam.TestFeign;
import com.kt.cloud.iam.auth.core.annotation.SkipPermissionCheck;
import com.kt.component.dto.ServerResponse;
import com.kt.component.dto.SingleResponse;
import com.kt.component.web.base.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
@SkipPermissionCheck
@Slf4j
public class AlertController extends BaseController {

    @Autowired
    private TestFeign testFeign;

    @RequestMapping("/alert")
    @SkipPermissionCheck
    public ServerResponse list(@RequestBody JSONObject jsonObject) {
        System.out.println(jsonObject);
        return ServerResponse.ok();
    }


    @GetMapping("/alert/test")
    @SkipPermissionCheck
    public ServerResponse test() {
        SingleResponse<String> test = testFeign.test();
        return SingleResponse.ok(test);
    }


    @RequestMapping("/docker")
    @SkipPermissionCheck
    public ServerResponse docker() throws UnknownHostException {
        log.info("request from " + getRequest().getRemoteAddr());
        InetAddress inetAddress= InetAddress.getLocalHost();
        log.info("you've hit " + inetAddress.getHostName());
        return ServerResponse.ok();
    }

}

