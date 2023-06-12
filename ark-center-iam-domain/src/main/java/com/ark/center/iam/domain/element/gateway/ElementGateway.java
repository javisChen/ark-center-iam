package com.ark.center.iam.domain.element.gateway;

import com.ark.center.iam.domain.element.Element;

import java.util.List;

public interface ElementGateway {
    void insert(Element element);

    void deleteByRouteId(Long routeId);

    List<Element> selectElementsByRouteId(Long routeId);
}
