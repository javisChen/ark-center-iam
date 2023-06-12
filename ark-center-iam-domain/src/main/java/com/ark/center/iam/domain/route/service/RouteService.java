package com.ark.center.iam.domain.route.service;

import com.ark.center.iam.domain.route.Route;
import com.ark.center.iam.domain.route.gateway.RouteGateway;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RouteService {

    private final RouteGateway routeGateway;


    /**
     * 同时更新当前路由及下级路由的状态
     *
     * @param routeId 路由id
     * @param status  状态
     */
    public void updateRouteStatus(Long routeId, Integer status) {
        Route route = routeGateway.selectBaseByRouteId(routeId);
        routeGateway.updateStatusByLevelPath(status, route.getLevelPath());
    }
}
