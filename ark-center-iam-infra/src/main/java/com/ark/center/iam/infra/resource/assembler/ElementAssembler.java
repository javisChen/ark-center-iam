package com.ark.center.iam.infra.resource.assembler;

import com.ark.center.iam.client.route.command.RouteCmd;
import com.ark.center.iam.domain.element.Element;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface ElementAssembler {

    @Mapping(target = "routeId", ignore = true)
    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "gmtModified", ignore = true)
    @Mapping(target = "gmtCreate", ignore = true)
    @Mapping(target = "creator", ignore = true)
    Element toElementDO(RouteCmd.Element element);
}
