package com.ark.center.iam.application.menu.executor;

import com.ark.center.iam.application.menu.MenuTreeService;
import com.ark.center.iam.client.menu.dto.MenuDTO;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.assembler.MenuAssembler;
import com.ark.center.iam.infra.menu.db.MenuDAO;
import com.ark.component.tree.TreeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class MenuDetailsQryExe {

    private final MenuDAO menuDAO;
    private final MenuAssembler menuAssembler;
    private final TreeService treeService;
    private final MenuTreeService menuTreeService;


    public MenuDTO execute(Long id) {
        Menu menu = menuDAO.getById(id);
        MenuDTO menuDTO = menuAssembler.toMenuDTO(menu);
        return menuTreeService.transformToTreeNode(menuDTO);
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
