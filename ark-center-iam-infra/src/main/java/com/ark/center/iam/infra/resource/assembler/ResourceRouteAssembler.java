package com.ark.center.iam.infra.resource.assembler;

import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.resource.ResourceRoute;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface ResourceRouteAssembler {

    UserRouteDTO toRouteDTO(ResourceRoute resourceRoute);

    List<UserRouteDTO> toRouteDTO(List<ResourceRoute> resourceRoute);
}
