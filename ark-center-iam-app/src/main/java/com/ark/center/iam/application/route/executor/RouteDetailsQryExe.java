package com.ark.center.iam.application.route.executor;

import com.ark.center.iam.client.menu.dto.MenuDTO;
import com.ark.center.iam.domain.element.gateway.ElementGateway;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.gateway.RouteGateway;
import com.ark.center.iam.infra.element.assembler.ElementAssembler;
import com.ark.center.iam.infra.route.assembler.RouteAssembler;
import com.ark.center.iam.infra.route.db.MenuDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class RouteDetailsQryExe {
    
    private final RouteGateway routeGateway;
    private final MenuDAO menuDAO;
    private final ElementGateway elementGateway;
    private final ElementAssembler elementAssembler;
    private final RouteAssembler routeAssembler;


    public MenuDTO execute(Long id) {
        Menu menu = menuDAO.getById(id);
        MenuDTO menuDTO = routeAssembler.toMenuDTO(menu);
        return menuDTO;
//        RouteDetailsDTO routeDetailsDTO = routeGateway.selectDetailsByRouteId(id);
//        if (routeDetailsDTO == null) {
//            return routeDetailsDTO;
//        }
//
//        List<Element> elements = elementGateway.selectElementsByRouteId(id);
//        routeDetailsDTO.setElements(elementAssembler.toElementDTO(elements));
//        return routeDetailsDTO;
    }
}
