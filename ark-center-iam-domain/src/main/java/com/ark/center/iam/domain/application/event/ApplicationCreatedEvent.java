package com.ark.center.iam.domain.application.event;


import com.ark.center.iam.domain.common.DomainEventTypes;
import com.ark.ddd.domain.event.DomainEvent;
import lombok.Getter;

@Getter
public class ApplicationCreatedEvent extends DomainEvent {

    private final Long appId;

    public ApplicationCreatedEvent(Long appId) {
        super(DomainEventTypes.APPLICATION_CREATED.name());
        this.appId = appId;
    }
}
