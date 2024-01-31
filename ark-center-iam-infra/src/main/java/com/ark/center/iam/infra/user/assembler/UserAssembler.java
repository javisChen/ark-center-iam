package com.ark.center.iam.infra.user.assembler;

import com.ark.center.iam.model.user.dto.UserRouteDTO;
import com.ark.center.iam.model.usergroup.dto.UserGroupListTreeDTO;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.usergroup.UserGroup;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface UserAssembler {

    UserRouteDTO toRouteDTO(Menu menu);

    List<UserRouteDTO> toRouteDTO(List<Menu> menu);

    UserGroupListTreeDTO toUserGroupListTreeDTO(UserGroup item);
}
