package com.ark.center.iam.application.menu.executor;

import com.ark.center.iam.client.menu.dto.MenuDTO;
import com.ark.center.iam.infra.menu.gateway.ElementGateway;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.gateway.MenuGateway;
import com.ark.center.iam.infra.element.assembler.ElementAssembler;
import com.ark.center.iam.infra.menu.assembler.RouteAssembler;
import com.ark.center.iam.infra.menu.db.MenuDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class MenuDetailsQryExe {
    
    private final MenuGateway menuGateway;
    private final MenuDAO menuDAO;
    private final ElementGateway elementGateway;
    private final ElementAssembler elementAssembler;
    private final RouteAssembler routeAssembler;


    public MenuDTO execute(Long id) {
        Menu menu = menuDAO.getById(id);
        return routeAssembler.toMenuDTO(menu);
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
