package com.ark.center.iam.infra.element.converter;

import com.ark.center.iam.infra.element.repository.db.MenuElementDO;
import com.ark.center.iam.model.element.dto.ElementBaseDTO;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface MenuElementAppConverter {

    List<ElementBaseDTO> toDTO(List<MenuElementDO> menuElementDOS);
}
