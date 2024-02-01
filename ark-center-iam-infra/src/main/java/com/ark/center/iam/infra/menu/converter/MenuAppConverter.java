package com.ark.center.iam.infra.menu.converter;

import com.ark.center.iam.infra.menu.repository.db.MenuDO;
import com.ark.center.iam.model.user.dto.UserRouteDTO;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface MenuAppConverter {

    List<UserRouteDTO> convert(List<MenuDO> menus);


}
