package com.ark.center.iam.infra.route.assembler;

import com.ark.center.iam.domain.menu.vo.Element;
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

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface MenuAssembler {

    List<UserRouteDTO> toRouteDTO(List<Menu> menu);

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
                .elements(toElement(command.getElements()))
        		.build();
    }

    List<Element> toElement(List<MenuCreateCommand.Element> elements);

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
}
