package com.ark.center.iam.application.route.executor;

import com.ark.center.iam.client.route.dto.RouteDetailsDTO;
import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.element.gateway.ElementGateway;
import com.ark.center.iam.domain.route.gateway.RouteGateway;
import com.ark.center.iam.infra.element.assembler.ElementAssembler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class RouteDetailsQryExe {
    
    private final RouteGateway routeGateway;
    private final ElementGateway elementGateway;
    private final ElementAssembler elementAssembler;

    public RouteDetailsDTO execute(Long id) {
        RouteDetailsDTO routeDetailsDTO = routeGateway.selectDetailsByRouteId(id);
        if (routeDetailsDTO == null) {
            return routeDetailsDTO;
        }
        List<Element> elements = elementGateway.selectElementsByRouteId(id);
        routeDetailsDTO.setElements(elementAssembler.toElementDTO(elements));
        return routeDetailsDTO;
    }
}
