package com.ark.center.iam.application.menu.converter;

import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.element.vo.ElementType;
import com.ark.center.iam.model.menu.command.ElementCommand;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface AppElementDomainConverter {

    List<Element> toDomain(List<ElementCommand> elements);

    default Element toDomain(ElementCommand elementCommand) {
        Element element = new Element();
        element.setId(elementCommand.getId());
        element.setName(elementCommand.getName());
        element.setType(ElementType.from(elementCommand.getType()));
        return element;
    }
}
