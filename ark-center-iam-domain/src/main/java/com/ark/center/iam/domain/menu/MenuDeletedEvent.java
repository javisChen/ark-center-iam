package com.ark.center.iam.domain.menu;

import com.ark.center.iam.domain.common.DomainEventTypes;
import com.ark.component.ddd.domain.event.DomainEvent;
import lombok.Getter;

import java.util.List;

/**
 * 菜单删除之后把下级菜单和菜单内元素都在事件中发布
 */
@Getter
public class MenuDeletedEvent extends DomainEvent {

    private final List<Long> menuIds;

    private final List<Long> elementIds;

    public MenuDeletedEvent(Object source, List<Long> menuIds, List<Long> elementIds) {
        super(source, DomainEventTypes.MENU_DELETED.name());
        this.menuIds = menuIds;
        this.elementIds = elementIds;
    }

}
