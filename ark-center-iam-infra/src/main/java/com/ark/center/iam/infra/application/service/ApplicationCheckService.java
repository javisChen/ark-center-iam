package com.ark.center.iam.infra.application.service;

import com.ark.center.iam.infra.application.Application;
import com.ark.component.orm.mybatis.service.CheckService;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * 角色校验服务
 */
@Service
public class ApplicationCheckService extends CheckService<Application> {

    public ApplicationCheckService(@Qualifier("applicationDAO") IService<Application> service) {
        super(service);
    }

    public void ensureNameNotExists(String name, Long roleId) {
        ensureRecordNotExists(Application::getName, name, roleId, "应用名称已存在");
    }

    public void ensureCodeNotExists(String code, Long roleId) {
        ensureRecordNotExists(Application::getCode, code, roleId, "应用编码已存在");
    }

}
