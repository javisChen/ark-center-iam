package com.ark.center.iam.infra.element.assembler;

import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.client.element.dto.ElementBaseDTO;
import com.ark.center.iam.infra.element.Element;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface ElementAssembler {

    @Mapping(target = "menuId", source = "menuId")
    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "createTime", ignore = true)
    @Mapping(target = "creator", ignore = true)
    Element toElementDO(MenuCommand.Element element, Long menuId);

    List<ElementBaseDTO> toElementDTO(List<Element> elements);

    ElementBaseDTO toElementDTO(Element elements);
}
