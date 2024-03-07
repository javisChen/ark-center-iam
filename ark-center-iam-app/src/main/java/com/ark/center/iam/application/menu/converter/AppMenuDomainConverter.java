package com.ark.center.iam.application.menu.converter;

import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.support.MenuDomainDTO;
import com.ark.center.iam.domain.menu.vo.MenuType;
import com.ark.center.iam.model.menu.command.MenuCreateCommand;
import com.ark.center.iam.model.menu.command.MenuUpdateCommand;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface AppMenuDomainConverter {

    default MenuDomainDTO fromCreate(MenuCreateCommand command, List<Element> elements, Menu parent) {
        MenuDomainDTO menu = new MenuDomainDTO();
        menu.setName(command.getName());
        menu.setApplicationId(command.getApplicationId());
        menu.setCode(command.getCode());
        menu.setComponent(command.getComponent());
        menu.setType(MenuType.from(command.getType()));
        menu.setHideChildren(command.getHideChildren());
        menu.setPid(command.getPid());
        menu.setSequence(command.getSequence());
        menu.setPath(command.getPath());
        menu.setIcon(command.getIcon());
        menu.setStatus(EnableDisableStatus.from(command.getStatus()));
        menu.setElements(elements);
        menu.setParent(parent);
        return menu;
    }

    default MenuDomainDTO fromUpdate(MenuUpdateCommand command, List<Element> elements, Menu parentMenu) {
        MenuDomainDTO menu = new MenuDomainDTO();
        menu.setId(command.getId());
        menu.setName(command.getName());
        menu.setApplicationId(command.getApplicationId());
        menu.setCode(command.getCode());
        menu.setComponent(command.getComponent());
        menu.setType(MenuType.from(command.getType()));
        menu.setHideChildren(command.getHideChildren());
        menu.setPid(command.getPid());
        menu.setSequence(command.getSequence());
        menu.setPath(command.getPath());
        menu.setIcon(command.getIcon());
        menu.setStatus(EnableDisableStatus.from(command.getStatus()));
        menu.setElements(elements);
        menu.setParent(parentMenu);
        return menu;
    }

}
