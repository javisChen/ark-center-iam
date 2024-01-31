package com.ark.center.iam.domain.menu;

import com.ark.center.iam.domain.common.DomainEventTypes;
import com.ark.component.ddd.domain.event.DomainEvent;
import lombok.Getter;

@Getter
public class MenuChangedEvent extends DomainEvent {

    private final Long menuId;

    public MenuChangedEvent(Object source, Long menuId) {
        super(source, DomainEventTypes.MENU_CREATED.name());
        this.menuId = menuId;
    }

}
