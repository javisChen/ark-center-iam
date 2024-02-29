package com.ark.center.iam.infra.menu.converter;

import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.menu.vo.MenuType;
import com.ark.center.iam.infra.element.converter.MenuElementDomainConverter;
import com.ark.center.iam.infra.menu.repository.db.MenuDO;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING,
        uses = MenuElementDomainConverter.class)
public interface MenuDomainConverter {

    default Menu toDomain(MenuDO menuDO, List<Element> elements, List<MenuDO> children) {
        Menu menu = new Menu();
        menu.setName(menuDO.getName());
        menu.setApplicationId(menuDO.getApplicationId());
        menu.setCode(menuDO.getCode());
        menu.setComponent(menuDO.getComponent());
        menu.setType(MenuType.from(menuDO.getType()));
        menu.setHideChildren(menuDO.getHideChildren());
        menu.setPid(menuDO.getPid());
        menu.setSequence(menuDO.getSequence());
        menu.setPath(menuDO.getPath());
        menu.setIcon(menuDO.getIcon());
        menu.setStatus(EnableDisableStatus.from(menuDO.getStatus()));
        // menu.setMenuElements(elements);
        menu.setChildren(children);
        menu.setId(menuDO.getId());
        menu.setCreateTime(menuDO.getCreateTime());
        menu.setUpdateTime(menuDO.getUpdateTime());
        menu.setCreator(menuDO.getCreator());
        menu.setModifier(menuDO.getModifier());
        return menu;
    }

    default MenuDO fromDomain(Menu menu) {
        MenuDO menuDO = new MenuDO();
        menuDO.setName(menu.getName());
        menuDO.setApplicationId(menu.getApplicationId());
        menuDO.setCode(menu.getCode());
        menuDO.setComponent(menu.getComponent());
        menuDO.setType(menu.getType().getValue());
        menuDO.setHideChildren(menu.getHideChildren());
        menuDO.setPid(menu.getPid());
        menuDO.setLevelPath(menu.getHierarchy().getPath());
        menuDO.setLevel(menu.getHierarchy().getLevel());
        menuDO.setSequence(menu.getSequence());
        menuDO.setPath(menu.getPath());
        menuDO.setIcon(menu.getIcon());
        menuDO.setStatus(menu.getStatus().getValue());
        menuDO.setId(menu.getId());
        return menuDO;
    }

}
