package com.ark.center.iam.infra.resource.assembler;

import com.ark.center.iam.client.route.command.RouteCmd;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.route.Route;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface RouteAssembler {

    UserRouteDTO toRouteDTO(Route route);

    List<UserRouteDTO> toRouteDTO(List<Route> route);

    Route toRouteDO(RouteCmd cmd);
}
