package com.ark.center.iam.infra.element.assembler;

import com.ark.center.iam.domain.menu.vo.MenuElement;
import com.ark.center.iam.model.menu.command.MenuCreateCommand;
import com.ark.center.iam.model.element.dto.ElementBaseDTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(componentModel = "spring")
public interface ElementAssembler {

    @Mapping(target = "routeId", source = "routeId")
    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "createTime", ignore = true)
    @Mapping(target = "creator", ignore = true)
    MenuElement toElementDO(MenuCreateCommand.Element element, Long routeId);

    List<ElementBaseDTO> toElementDTO(List<MenuElement> menuElements);
    ElementBaseDTO toElementDTO(MenuElement elements);
}
