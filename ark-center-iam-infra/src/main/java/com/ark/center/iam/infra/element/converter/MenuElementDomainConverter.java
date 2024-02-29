package com.ark.center.iam.infra.element.converter;

import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.element.vo.ElementType;
import com.ark.center.iam.infra.element.repository.db.MenuElementDO;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface MenuElementDomainConverter {

    List<Element> toDomain(List<MenuElementDO> elements);

    default Element toDomain(MenuElementDO element) {
        return Element.builder()
                .id(element.getId())
        		.name(element.getName())
        		.type(ElementType.from(element.getType()))
        		.build();
    }


    List<MenuElementDO> fromDomain(List<Element> elements);

    default MenuElementDO fromDomain(Element element) {
        MenuElementDO menuElementDO = new MenuElementDO();
        menuElementDO.setName(element.getName());
        menuElementDO.setType(element.getType().getValue());
        return menuElementDO;
    }

}
