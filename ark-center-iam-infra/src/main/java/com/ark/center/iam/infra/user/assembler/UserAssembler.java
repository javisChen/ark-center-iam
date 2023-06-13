package com.ark.center.iam.infra.user.assembler;

import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.client.usergroup.dto.UserGroupListTreeDTO;
import com.ark.center.iam.domain.route.Route;
import com.ark.center.iam.domain.usergroup.UserGroup;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface UserAssembler {

    UserRouteDTO toRouteDTO(Route route);

    List<UserRouteDTO> toRouteDTO(List<Route> route);

    UserGroupListTreeDTO toUserGroupListTreeDTO(UserGroup item);
}
