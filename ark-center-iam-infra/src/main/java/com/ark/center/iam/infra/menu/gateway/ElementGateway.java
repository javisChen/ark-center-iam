package com.ark.center.iam.infra.menu.gateway;

import com.ark.center.iam.infra.element.Element;

import java.util.List;

public interface ElementGateway {

    void insert(Element element);

    void deleteByMenuId(Long menuId);

    List<Element> selectElementsByRouteId(Long menuId);

}
