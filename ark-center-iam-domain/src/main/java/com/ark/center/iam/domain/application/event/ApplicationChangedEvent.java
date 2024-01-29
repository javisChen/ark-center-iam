package com.ark.center.iam.domain.application.event;

import com.ark.center.iam.domain.common.DomainEventTypes;
import com.ark.component.ddd.domain.event.DomainEvent;
import lombok.Getter;

@Getter
public class ApplicationChangedEvent extends DomainEvent {

    private final Long appId;

    public ApplicationChangedEvent(Object source, Long appId) {
        super(source, DomainEventTypes.APPLICATION_CHANGED.name());
        this.appId = appId;
    }
}
