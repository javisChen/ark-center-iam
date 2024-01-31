package com.ark.center.iam.application.menu;

import com.ark.center.iam.application.menu.executor.RouteDetailsQryExe;
import com.ark.center.iam.application.menu.executor.RouteTreeQryExe;
import com.ark.center.iam.model.element.dto.ElementBaseDTO;
import com.ark.center.iam.model.menu.dto.RouteDetailsDTO;
import com.ark.center.iam.model.menu.query.MenuQuery;
import com.ark.center.iam.domain.menu.vo.Element;
import com.ark.center.iam.domain.element.gateway.ElementGateway;
import com.ark.center.iam.infra.element.assembler.ElementAssembler;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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

    public Page<RouteDetailsDTO> queryPage(MenuQuery dto) {
        return routeTreeQryExe.execute(dto);
    }

    public List<RouteDetailsDTO> queryAll(MenuQuery query) {
        query.setSize(500);
        return queryPage(query).getRecords();
    }

    public RouteDetailsDTO queryDetails(Long id) {
        return routeDetailsQryExe.execute(id);
    }

    public List<ElementBaseDTO> queryRouteElementsById(Long routeId) {
        List<Element> elements = elementGateway.selectElementsByRouteId(routeId);
        return elements.stream().map(elementAssembler::toElementDTO).collect(Collectors.toList());
    }
}
