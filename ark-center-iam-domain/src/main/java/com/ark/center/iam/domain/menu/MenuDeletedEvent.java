package com.ark.center.iam.domain.menu;

import com.ark.center.iam.domain.common.DomainEventTypes;
import com.ark.component.ddd.domain.event.DomainEvent;
import lombok.Getter;

@Getter
public class MenuDeletedEvent extends DomainEvent {

    private final Long menuId;

    public MenuDeletedEvent(Object source, Long menuId) {
        super(source, DomainEventTypes.MENU_DELETED.name());
        this.menuId = menuId;
    }

}
