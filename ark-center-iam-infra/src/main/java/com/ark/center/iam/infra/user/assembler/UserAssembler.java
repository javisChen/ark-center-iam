package com.ark.center.iam.infra.user.assembler;

import com.ark.center.iam.client.user.dto.UserMenuDTO;
import com.ark.center.iam.client.usergroup.dto.UserGroupListTreeDTO;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.usergroup.UserGroup;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface UserAssembler {

    UserMenuDTO toRouteDTO(Menu menu);

    List<UserMenuDTO> toRouteDTO(List<Menu> menu);
    UserGroupListTreeDTO toUserGroupListTreeDTO(UserGroup item);
}
