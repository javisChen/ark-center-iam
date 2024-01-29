package com.ark.center.iam.domain.api.event;

import com.ark.center.iam.domain.common.DomainEventTypes;
import com.ark.component.ddd.domain.event.DomainEvent;
import lombok.Getter;

@Getter
public class ApiChangedEvent extends DomainEvent {

    private final Long apiId;

    public ApiChangedEvent(Object source, Long apiId) {
        super(source, DomainEventTypes.API_CHANGED.name());
        this.apiId = apiId;
    }

}
