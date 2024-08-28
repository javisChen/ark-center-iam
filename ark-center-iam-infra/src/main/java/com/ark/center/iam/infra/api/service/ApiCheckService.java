package com.ark.center.iam.infra.api.service;

import com.ark.center.iam.infra.api.Api;
import com.ark.component.orm.mybatis.service.CheckService;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.stereotype.Service;

/**
 * API校验服务
 */
@Service
public class ApiCheckService extends CheckService<Api> {


    public ApiCheckService(IService<Api> service) {
        super(service);
    }
}
