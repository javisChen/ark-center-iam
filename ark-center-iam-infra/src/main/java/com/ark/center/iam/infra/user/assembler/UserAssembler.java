package com.ark.center.iam.infra.user.assembler;

import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.client.usergroup.dto.UserGroupListTreeDTO;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.usergroup.UserGroup;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface UserAssembler {

    UserRouteDTO toRouteDTO(Menu menu);

    List<UserRouteDTO> toRouteDTO(List<Menu> menu);
    UserGroupListTreeDTO toUserGroupListTreeDTO(UserGroup item);
}
