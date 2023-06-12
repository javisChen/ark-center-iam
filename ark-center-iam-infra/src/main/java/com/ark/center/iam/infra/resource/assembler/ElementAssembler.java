package com.ark.center.iam.infra.resource.assembler;

import com.ark.center.iam.client.route.command.RouteCmd;
import com.ark.center.iam.client.element.dto.ElementBaseDTO;
import com.ark.center.iam.domain.element.Element;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(componentModel = "spring")
public interface ElementAssembler {

    @Mapping(target = "routeId", source = "routeId")
    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "gmtModified", ignore = true)
    @Mapping(target = "gmtCreate", ignore = true)
    @Mapping(target = "creator", ignore = true)
    Element toElementDO(RouteCmd.Element element, Long routeId);

    List<ElementBaseDTO> toElementDTO(List<Element> elements);
    ElementBaseDTO toElementDTO(Element elements);
}
