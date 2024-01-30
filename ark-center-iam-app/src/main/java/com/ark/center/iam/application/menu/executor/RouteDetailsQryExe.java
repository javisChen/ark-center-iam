package com.ark.center.iam.application.menu.executor;

import com.ark.center.iam.client.menu.dto.RouteDetailsDTO;
import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.element.gateway.ElementGateway;
import com.ark.center.iam.infra.element.assembler.ElementAssembler;
import com.ark.center.iam.infra.route.gateway.db.MenuMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class RouteDetailsQryExe {
    
    private final MenuMapper menuMapper;
    private final ElementGateway elementGateway;
    private final ElementAssembler elementAssembler;

    public RouteDetailsDTO execute(Long id) {
        RouteDetailsDTO routeDetailsDTO = menuMapper.selectDetails(id);
        List<Element> elements = elementGateway.selectElementsByRouteId(id);
        routeDetailsDTO.setElements(elementAssembler.toElementDTO(elements));
        return routeDetailsDTO;
    }
}
