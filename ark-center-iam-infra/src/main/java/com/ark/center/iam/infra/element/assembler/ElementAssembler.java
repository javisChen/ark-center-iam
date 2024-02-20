package com.ark.center.iam.infra.element.assembler;

import com.ark.center.iam.domain.menu.vo.MenuElement;
import com.ark.center.iam.model.element.dto.ElementBaseDTO;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface ElementAssembler {

    List<ElementBaseDTO> toElementDTO(List<MenuElement> menuElements);

    default ElementBaseDTO toElementDTO(MenuElement menuElement) {
        ElementBaseDTO elementBaseDTO = new ElementBaseDTO();
        elementBaseDTO.setId(menuElement.getId());
        elementBaseDTO.setName(menuElement.getName());
        elementBaseDTO.setType(menuElement.getType().getValue());
        return elementBaseDTO;
    }
}
