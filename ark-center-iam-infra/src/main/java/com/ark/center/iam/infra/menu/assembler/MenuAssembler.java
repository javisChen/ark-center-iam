package com.ark.center.iam.infra.menu.assembler;

import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.client.menu.command.RouteModifyParentCmd;
import com.ark.center.iam.client.menu.dto.MenuDTO;
import com.ark.center.iam.client.user.dto.UserMenuDTO;
import com.ark.center.iam.infra.enums.RouteTypeEnums;
import com.ark.center.iam.infra.menu.Menu;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface MenuAssembler {

    @Mapping(target = "redirect", ignore = true)
    @Mapping(target = "parentId", ignore = true)
    @Mapping(target = "meta", expression = "java(assembleMeta(menu))")
    UserMenuDTO toUserMenuDTO(Menu menu);

    //    @Mapping(target = "pid", ignore = true)
//    @Mapping(target = "levelPath", ignore = true)
//    @Mapping(target = "level", ignore = true)
    @Mapping(target = "pid", ignore = true)
    MenuDTO toMenuDTO(Menu menu);

    List<MenuDTO> toMenuDTO(List<Menu> menus);


    default UserMenuDTO.Meta assembleMeta(Menu item) {
        UserMenuDTO.Meta meta = new UserMenuDTO.Meta();
        meta.setIcon(item.getIcon());
        meta.setTitle(item.getName());
        meta.setHideChildren(item.getHideChildren());
        meta.setShow(!item.getType().equals(RouteTypeEnums.PAGE_HIDDEN.getValue()));
        return meta;
    }

    List<UserMenuDTO> toUserMenuDTO(List<Menu> menu);

    @Mapping(target = "modifier", ignore = true)
//    @Mapping(target = "levelPath", ignore = true)
//    @Mapping(target = "level", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "createTime", ignore = true)
    @Mapping(target = "creator", ignore = true)
    Menu toMenuDO(MenuCommand cmd);

    @Mapping(target = "path2", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "component2", ignore = true)
    @Mapping(target = "type", ignore = true)
    @Mapping(target = "status", ignore = true)
    @Mapping(target = "sequence", ignore = true)
    @Mapping(target = "path", ignore = true)
    @Mapping(target = "name", ignore = true)
    @Mapping(target = "modifier", ignore = true)
//    @Mapping(target = "levelPath", ignore = true)
//    @Mapping(target = "level", ignore = true)
//    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "icon", ignore = true)
    @Mapping(target = "hideChildren", ignore = true)
    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "createTime", ignore = true)
    @Mapping(target = "creator", ignore = true)
    @Mapping(target = "component", ignore = true)
    @Mapping(target = "code", ignore = true)
    @Mapping(target = "applicationId", ignore = true)
    Menu toMenuDO(RouteModifyParentCmd cmd);

}
