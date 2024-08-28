package com.ark.center.iam.application.route;

import cn.hutool.core.lang.tree.Tree;
import com.ark.center.iam.application.route.executor.*;
import com.ark.center.iam.client.element.dto.ElementBaseDTO;
import com.ark.center.iam.client.menu.dto.MenuDTO;
import com.ark.center.iam.client.menu.query.MenuQuery;
import com.ark.center.iam.infra.element.Element;
import com.ark.center.iam.infra.element.gateway.ElementGateway;
import com.ark.center.iam.infra.element.assembler.ElementAssembler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MenuQueryService {

    private final RouteTreeQryExe routeTreeQryExe;
    private final RouteDetailsQryExe routeDetailsQryExe;
    private final ElementGateway elementGateway;
    private final ElementAssembler elementAssembler;

    public List<Tree<Long>> queryMenus(MenuQuery dto) {
        return routeTreeQryExe.execute(dto);
    }

    public List<Tree<Long>> queryList(MenuQuery dto) {
        dto.setSize(99999);
        return queryMenus(dto);
    }


    public MenuDTO queryDetails(Long id) {
        return routeDetailsQryExe.execute(id);
    }


    public List<ElementBaseDTO> queryRouteElementsById(Long routeId) {
        List<Element> elements = elementGateway.selectElementsByRouteId(routeId);
        return elements.stream().map(elementAssembler::toElementDTO).collect(Collectors.toList());
    }
}
