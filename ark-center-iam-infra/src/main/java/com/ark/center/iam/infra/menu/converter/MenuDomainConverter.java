package com.ark.center.iam.infra.menu.converter;

import com.ark.center.iam.domain.menu.vo.MenuElement;
import com.ark.center.iam.infra.menu.repository.db.MenuDO;
import com.ark.center.iam.infra.menu.repository.db.MenuElementDO;
import com.ark.center.iam.model.menu.command.MenuCreateCommand;
import com.ark.center.iam.model.menu.command.MenuModifyParentCommand;
import com.ark.center.iam.model.menu.command.MenuUpdateCommand;
import com.ark.center.iam.model.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.vo.MenuType;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING,
        uses = MenuElementDomainConverter.class)
public interface MenuDomainConverter {

    List<UserRouteDTO> convert(List<Menu> menu);

    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "levelPath", ignore = true)
    @Mapping(target = "level", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "createTime", ignore = true)
    @Mapping(target = "creator", ignore = true)
    default Menu toDomain(MenuCreateCommand command) {
        return Menu.builder()
        		.name(command.getName())
        		.applicationId(command.getApplicationId())
        		.code(command.getCode())
        		.component(command.getComponent())
        		.type(MenuType.from(command.getType()))
        		.hideChildren(command.getHideChildren())
        		.pid(command.getPid())
        		.sequence(command.getSequence())
        		.path(command.getPath())
        		.icon(command.getIcon())
        		.status(EnableDisableStatus.from(command.getStatus()))
                .menuElements(toElement(command.getElements()))
        		.build();
    }

    List<MenuElement> toElement(List<MenuCreateCommand.Element> elements);

    @Mapping(target = "type", ignore = true)
    @Mapping(target = "status", ignore = true)
    @Mapping(target = "sequence", ignore = true)
    @Mapping(target = "path", ignore = true)
    @Mapping(target = "name", ignore = true)
    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "levelPath", ignore = true)
    @Mapping(target = "level", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "icon", ignore = true)
    @Mapping(target = "hideChildren", ignore = true)
    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "createTime", ignore = true)
    @Mapping(target = "creator", ignore = true)
    @Mapping(target = "component", ignore = true)
    @Mapping(target = "code", ignore = true)
    @Mapping(target = "applicationId", ignore = true)
    Menu toDomain(MenuModifyParentCommand command);

    @Mapping(target = "levelPath", ignore = true)
    @Mapping(target = "level", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "children", ignore = true)
    Menu toDomain(MenuUpdateCommand command);

    List<Menu> convert(List<MenuDO> menus);

    default Menu convert(MenuDO menuDO, List<MenuElement> elements, List<MenuDO> children) {
        return Menu.builder()
        		.name(menuDO.getName())
        		.applicationId(menuDO.getApplicationId())
        		.code(menuDO.getCode())
        		.component(menuDO.getComponent())
        		.type(MenuType.from(menuDO.getType()))
        		.hideChildren(menuDO.getHideChildren())
        		.pid(menuDO.getPid())
        		.levelPath(menuDO.getLevelPath())
        		.level(menuDO.getLevel())
        		.sequence(menuDO.getSequence())
        		.path(menuDO.getPath())
        		.icon(menuDO.getIcon())
        		.status(EnableDisableStatus.from(menuDO.getStatus()))
        		.menuElements(elements)
        		.children(convert(children))
        		.build();
    }

    default MenuDO convert(Menu menu) {
        MenuDO menuDO = new MenuDO();
        menuDO.setName(menu.getName());
        menuDO.setApplicationId(menu.getApplicationId());
        menuDO.setCode(menu.getCode());
        menuDO.setComponent(menu.getComponent());
        menuDO.setType(menu.getType().getValue());
        menuDO.setHideChildren(menu.getHideChildren());
        menuDO.setPid(menu.getPid());
        menuDO.setLevelPath(menu.getLevelPath());
        menuDO.setLevel(menu.getLevel());
        menuDO.setSequence(menu.getSequence());
        menuDO.setPath(menu.getPath());
        menuDO.setIcon(menu.getIcon());
        menuDO.setStatus(menu.getStatus().getValue());
        menuDO.setId(menu.getId());
        return menuDO;
    }

}
