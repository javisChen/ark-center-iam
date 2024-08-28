package com.ark.center.iam.infra.element.gateway;

import com.ark.center.iam.infra.element.Element;

import java.util.List;

public interface ElementGateway {
    void insert(Element element);

    void deleteByRouteId(Long routeId);

    List<Element> selectElementsByRouteId(Long routeId);
}
