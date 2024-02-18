package com.ark.center.iam.domain.role.event;

import com.ark.center.iam.domain.common.DomainEventTypes;
import com.ark.component.ddd.domain.event.DomainEvent;
import lombok.Getter;

@Getter
public class RoleDeletedEvent extends DomainEvent {

    private final Long roleId;

    public RoleDeletedEvent(Object source, Long apiId) {
        super(source, DomainEventTypes.ROLE_DELETED.name());
        this.roleId = apiId;
    }
}
