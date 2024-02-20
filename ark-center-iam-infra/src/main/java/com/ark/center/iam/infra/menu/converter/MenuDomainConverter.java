package com.ark.center.iam.infra.menu.converter;

import com.ark.center.iam.domain.common.hierarchy.Hierarchy;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.vo.MenuElement;
import com.ark.center.iam.domain.menu.vo.MenuType;
import com.ark.center.iam.infra.menu.repository.db.MenuDO;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING,
        uses = MenuElementDomainConverter.class)
public interface MenuDomainConverter {

//    List<Menu> toDomain(List<MenuDO> menus);

    default Menu toDomain(MenuDO menuDO, List<MenuElement> elements, List<MenuDO> children) {
        return Menu.builder()
        		.name(menuDO.getName())
        		.applicationId(menuDO.getApplicationId())
        		.code(menuDO.getCode())
        		.component(menuDO.getComponent())
        		.type(MenuType.from(menuDO.getType()))
        		.hideChildren(menuDO.getHideChildren())
        		.pid(menuDO.getPid())
                .hierarchy(Hierarchy.builder()
                        .level(menuDO.getLevel())
                        .path(menuDO.getLevelPath())
                        .build())
        		.sequence(menuDO.getSequence())
        		.path(menuDO.getPath())
        		.icon(menuDO.getIcon())
        		.status(EnableDisableStatus.from(menuDO.getStatus()))
        		.menuElements(elements)
        		// .children(toDomain(children))
        		.build();
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
