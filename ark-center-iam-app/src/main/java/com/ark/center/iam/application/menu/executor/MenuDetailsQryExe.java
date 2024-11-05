package com.ark.center.iam.application.menu.executor;

import com.ark.center.iam.infra.menu.service.ElementService;
import com.ark.center.iam.infra.menu.service.MenuBizTreeService;
import com.ark.center.iam.client.element.dto.ElementBaseDTO;
import com.ark.center.iam.client.menu.dto.MenuDTO;
import com.ark.center.iam.infra.menu.Element;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.assembler.MenuAssembler;
import com.ark.center.iam.infra.menu.db.MenuDAO;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class MenuDetailsQryExe {

    private final MenuDAO menuDAO;
    private final MenuAssembler menuAssembler;
    private final ElementService elementService;
    private final MenuBizTreeService menuHierarchyService;

    public MenuDTO execute(Long id) {
        Menu menu = menuDAO.getById(id);
        MenuDTO menuDTO = menuAssembler.toMenuDTO(menu);
        List<Element> elements = elementService.byMenuId(id);
        setupElements(elements, menuDTO);
        return menuHierarchyService.transformToTreeNode(menuDTO);
    }

    private void setupElements(List<Element> elements, MenuDTO menuDTO) {
        List<ElementBaseDTO> elementBaseDTOS = elements.stream().map(e -> {
            ElementBaseDTO elementBaseDTO = new ElementBaseDTO();
            elementBaseDTO.setId(e.getId());
            elementBaseDTO.setMenuId(e.getMenuId());
            elementBaseDTO.setName(e.getName());
            elementBaseDTO.setType(e.getType());
            return elementBaseDTO;
        }).toList();
        menuDTO.setElements(elementBaseDTOS);
    }

}
