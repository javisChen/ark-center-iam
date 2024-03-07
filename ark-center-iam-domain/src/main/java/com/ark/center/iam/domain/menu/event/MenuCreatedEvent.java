package com.ark.center.iam.domain.menu.event;

import com.ark.center.iam.domain.common.DomainEventTypes;
import com.ark.component.ddd.domain.event.DomainEvent;
import lombok.Getter;

@Getter
public class MenuCreatedEvent extends DomainEvent {

    private final Long menuId;

    public MenuCreatedEvent(Object source, Long menuId) {
        super(source, DomainEventTypes.MENU_CHANGED.name());
        this.menuId = menuId;
    }

}
