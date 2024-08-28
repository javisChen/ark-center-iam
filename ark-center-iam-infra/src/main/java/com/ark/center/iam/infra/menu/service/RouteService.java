package com.ark.center.iam.infra.menu.service;

import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.gateway.MenuGateway;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RouteService {

    private final MenuGateway menuGateway;


    /**
     * 同时更新当前路由及下级路由的状态
     *
     * @param routeId 路由id
     * @param status  状态
     */
    public void updateRouteStatus(Long routeId, Integer status) {
//        Menu menu = menuGateway.selectBaseByRouteId(routeId);
//        menuGateway.updateStatusByLevelPath(status, menu.getLevelPath());
    }
}
