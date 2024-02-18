package com.ark.center.iam.infra.menu.converter;

import com.ark.center.iam.domain.menu.vo.ElementType;
import com.ark.center.iam.domain.menu.vo.MenuElement;
import com.ark.center.iam.infra.menu.repository.db.MenuElementDO;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface MenuElementDomainConverter {

    List<MenuElement> toDomain(List<MenuElementDO> elements);

    default MenuElement toDomain(MenuElementDO element) {
        return MenuElement.builder()
        		.name(element.getName())
        		.type(ElementType.from(element.getType()))
        		.build();
    }


    List<MenuElementDO> fromDomain(List<MenuElement> menuElements);

    default MenuElementDO fromDomain(MenuElement menuElement) {
        MenuElementDO menuElementDO = new MenuElementDO();
        menuElementDO.setName(menuElement.getName());
        menuElementDO.setType(menuElement.getType().getValue());
        return menuElementDO;
    }

}
