package com.kt.iam.module.alert;


import com.alibaba.fastjson.JSONObject;
import com.kt.component.dto.ServerResponse;
import com.kt.component.web.base.BaseController;
import com.kt.iam.auth.core.SkipCheck;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
public class AlertController extends BaseController {


    @RequestMapping("/alert")
    @SkipCheck
    public ServerResponse list(@RequestBody JSONObject jsonObject) {
        System.out.println(jsonObject);
        return ServerResponse.ok();
    }

}

