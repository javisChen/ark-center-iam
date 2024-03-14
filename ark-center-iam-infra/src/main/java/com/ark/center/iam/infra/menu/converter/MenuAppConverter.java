package com.ark.center.iam.infra.menu.converter;

import com.ark.center.iam.domain.menu.vo.MenuType;
import com.ark.center.iam.infra.menu.repository.db.MenuDO;
import com.ark.center.iam.model.user.dto.UserRouteDTO;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface MenuAppConverter {

    List<UserRouteDTO> convert(List<MenuDO> menus);

    default UserRouteDTO convert(MenuDO menu) {
        UserRouteDTO userRouteDTO = new UserRouteDTO();
        userRouteDTO.setName(menu.getName());
        userRouteDTO.setParentId(menu.getPid());
        userRouteDTO.setId(menu.getId());
        userRouteDTO.setMeta(meta(menu));
        userRouteDTO.setComponent(menu.getComponent());
        // userRouteDTO.setRedirect(menu.get);
        userRouteDTO.setPath(menu.getPath());
        return userRouteDTO;
    }

    default UserRouteDTO.Meta meta(MenuDO item) {
        UserRouteDTO.Meta meta = new UserRouteDTO.Meta();
        meta.setIcon(item.getIcon());
        meta.setTitle(item.getName());
        meta.setHideChildren(item.getHideChildren());
        meta.setShow(!item.getType().equals(MenuType.PAGE_HIDDEN.getValue()));
        return meta;
    }


}
