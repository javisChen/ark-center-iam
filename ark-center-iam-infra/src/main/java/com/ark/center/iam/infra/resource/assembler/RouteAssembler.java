package com.ark.center.iam.infra.resource.assembler;

import com.ark.center.iam.client.route.command.RouteCmd;
import com.ark.center.iam.client.route.command.RouteModifyParentCmd;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.route.Route;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(componentModel = "spring")
public interface RouteAssembler {

    @Mapping(target = "redirect", ignore = true)
    @Mapping(target = "parentId", ignore = true)
    @Mapping(target = "meta", ignore = true)
    UserRouteDTO toRouteDTO(Route route);

    List<UserRouteDTO> toRouteDTO(List<Route> route);

    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "levelPath", ignore = true)
    @Mapping(target = "level", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "gmtModified", ignore = true)
    @Mapping(target = "gmtCreate", ignore = true)
    @Mapping(target = "creator", ignore = true)
    Route toRouteDO(RouteCmd cmd);

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
    @Mapping(target = "gmtModified", ignore = true)
    @Mapping(target = "gmtCreate", ignore = true)
    @Mapping(target = "creator", ignore = true)
    @Mapping(target = "component", ignore = true)
    @Mapping(target = "code", ignore = true)
    @Mapping(target = "applicationId", ignore = true)
    Route toRouteDO(RouteModifyParentCmd cmd);
}
