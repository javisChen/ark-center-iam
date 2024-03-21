package com.ark.center.iam.infra.menu.converter;

import com.ark.center.iam.domain.menu.vo.MenuType;
import com.ark.center.iam.infra.menu.repository.db.MenuDO;
import com.ark.center.iam.model.user.dto.UserMenuDTO;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface MenuAppConverter {

    List<UserMenuDTO> convert(List<MenuDO> menus);

    default UserMenuDTO convert(MenuDO menu) {
        UserMenuDTO userMenuDTO = new UserMenuDTO();
        userMenuDTO.setName(menu.getName());
        userMenuDTO.setParentId(menu.getPid());
        userMenuDTO.setId(menu.getId());
        userMenuDTO.setMeta(meta(menu));
        userMenuDTO.setComponent(menu.getComponent());
        // userRouteDTO.setRedirect(menu.get);
        userMenuDTO.setPath(menu.getPath());
        return userMenuDTO;
    }

    default UserMenuDTO.Meta meta(MenuDO item) {
        UserMenuDTO.Meta meta = new UserMenuDTO.Meta();
        meta.setIcon(item.getIcon());
        meta.setTitle(item.getName());
        meta.setHideChildren(item.getHideChildren());
        meta.setShow(!item.getType().equals(MenuType.PAGE_HIDDEN.getValue()));
        return meta;
    }


}
