package com.ark.center.iam.domain.route.service;

import com.ark.center.iam.domain.route.Route;
import com.ark.component.orm.mybatis.service.CheckService;
import org.springframework.stereotype.Service;

@Service
public class RouteCheckService extends CheckService<Route> {

    public void ensureRouteNotExists(Long id) {
        ensureRecordNotExists(Route::getId, id, "路由不存在");
    }

    public void ensureRouteNotExists(Long id, String msg) {
        ensureRecordNotExists(Route::getId, id, msg);
    }

    public void ensureNameNotExists(String name, Long id) {
        ensureRecordNotExists(Route::getName, name, id, "路由名称已存在");
    }
    public void ensureCodeNotExists(String code, Long id) {
        ensureRecordNotExists(Route::getCode, code, id, "路由编码已存在");
    }
}
