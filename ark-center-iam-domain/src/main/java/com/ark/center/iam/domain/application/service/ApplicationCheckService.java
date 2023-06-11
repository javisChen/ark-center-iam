package com.ark.center.iam.domain.application.service;

import com.ark.center.iam.domain.application.Application;
import com.ark.component.orm.mybatis.service.CheckService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 角色校验服务
 */
@Service
@RequiredArgsConstructor
public class ApplicationCheckService extends CheckService<Application> {

    public void ensureNameNotExists(String name, Long roleId) {
        ensureRecordNotExists(Application::getName, name, roleId, "应用名称已存在");
    }

    public void ensureCodeNotExists(String code, Long roleId) {
        ensureRecordNotExists(Application::getCode, code, roleId, "应用编码已存在");
    }

}
