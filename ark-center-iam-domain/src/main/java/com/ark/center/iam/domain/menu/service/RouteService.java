package com.ark.center.iam.domain.menu.service;

import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.repository.MenuRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RouteService {

    private final MenuRepository menuRepository;


    /**
     * 同时更新当前路由及下级路由的状态
     *
     * @param routeId 路由id
     * @param status  状态
     */
    public void updateRouteStatus(Long routeId, Integer status) {
        Menu menu = menuRepository.selectBaseByRouteId(routeId);
        menuRepository.updateStatusByLevelPath(status, menu.getLevelPath());
    }
}
