package com.ark.center.iam.domain.menu.service;

import com.ark.center.iam.domain.menu.Menu;
import com.ark.component.orm.mybatis.service.CheckService;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class RouteCheckService extends CheckService<Menu> {

    public RouteCheckService(@Qualifier("menuDAO") IService<Menu> service) {
        super(service);
    }

    public void ensureRouteNotExists(Long id) {
        ensureRecordNotExists(Menu::getId, id, "路由不存在");
    }

    public void ensureRouteNotExists(Long id, String msg) {
        ensureRecordNotExists(Menu::getId, id, msg);
    }

    public void ensureNameNotExists(String name, Long id) {
        ensureRecordNotExists(Menu::getName, name, id, "路由名称已存在");
    }
    public void ensureCodeNotExists(String code, Long id) {
        ensureRecordNotExists(Menu::getCode, code, id, "路由编码已存在");
    }
}
