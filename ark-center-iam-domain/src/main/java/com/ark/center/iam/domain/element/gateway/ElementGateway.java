package com.ark.center.iam.domain.element.gateway;

import com.ark.center.iam.domain.menu.vo.MenuElement;

import java.util.List;

public interface ElementGateway {
    void insert(MenuElement menuElement);

    void deleteByRouteId(Long routeId);

    List<MenuElement> selectElementsByRouteId(Long routeId);
}
