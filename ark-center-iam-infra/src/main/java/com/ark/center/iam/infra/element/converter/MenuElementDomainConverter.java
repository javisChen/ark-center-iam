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

    default Element toDomain(MenuElementDO elementDO) {
        Element element = new Element();
        element.setId(elementDO.getId());
        element.setName(elementDO.getName());
        element.setType(ElementType.from(elementDO.getType()));
        element.setId(elementDO.getId());
        element.setCreateTime(elementDO.getCreateTime());
        element.setUpdateTime(elementDO.getUpdateTime());
        element.setCreator(elementDO.getCreator());
        element.setModifier(elementDO.getModifier());
        return element;
    }


    List<MenuElementDO> fromDomain(List<Element> elements);

    default MenuElementDO fromDomain(Element element) {
        MenuElementDO menuElementDO = new MenuElementDO();
        menuElementDO.setName(element.getName());
        menuElementDO.setType(element.getType().getValue());
        return menuElementDO;
    }

}
