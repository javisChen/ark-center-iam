package com.ark.center.iam.infra.route.assembler;

import com.ark.center.iam.client.route.command.RouteCmd;
import com.ark.center.iam.client.route.command.RouteModifyParentCmd;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.enums.RouteTypeEnums;
import com.ark.center.iam.domain.route.Route;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(componentModel = "spring")
public interface RouteAssembler {

    @Mapping(target = "parentId", source = "pid")
    @Mapping(target = "meta", expression = "java(assembleMeta(route))")
    UserRouteDTO toRouteDTO(Route route);


    default UserRouteDTO.Meta assembleMeta(Route item) {
        UserRouteDTO.Meta meta = new UserRouteDTO.Meta();
        meta.setIcon(item.getIcon());
        meta.setTitle(item.getName());
        meta.setHideChildren(item.getHideChildren());
        meta.setShow(!item.getType().equals(RouteTypeEnums.PAGE_HIDDEN.getValue()));
        return meta;
    }

    List<UserRouteDTO> toRouteDTO(List<Route> route);

    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "levelPath", ignore = true)
    @Mapping(target = "level", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "createTime", ignore = true)
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
    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "createTime", ignore = true)
    @Mapping(target = "creator", ignore = true)
    @Mapping(target = "component", ignore = true)
    @Mapping(target = "code", ignore = true)
    @Mapping(target = "applicationId", ignore = true)
    Route toRouteDO(RouteModifyParentCmd cmd);
}
