package com.ark.center.iam.domain.app.event;


import com.ark.center.iam.domain.common.DomainEventTypes;
import com.ark.component.ddd.domain.event.DomainEvent;
import lombok.Getter;

@Getter
public class ApplicationCreatedEvent extends DomainEvent {

    private final Long appId;

    public ApplicationCreatedEvent(Object source, Long appId) {
        super(source, DomainEventTypes.APPLICATION_CREATED.name());
        this.appId = appId;
    }
}