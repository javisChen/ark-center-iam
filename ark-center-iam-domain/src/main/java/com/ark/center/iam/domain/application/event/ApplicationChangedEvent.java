package com.ark.center.iam.domain.application.event;


import com.ark.center.iam.domain.common.DomainEventTypes;
import com.ark.component.ddd.domain.event.DomainEvent;
import lombok.Getter;

@Getter
public class ApplicationChangedEvent extends DomainEvent {

    private final Long appId;

    public ApplicationChangedEvent(Long appId) {
        super(DomainEventTypes.APPLICATION_CHANGED.name());
        this.appId = appId;
    }
}
