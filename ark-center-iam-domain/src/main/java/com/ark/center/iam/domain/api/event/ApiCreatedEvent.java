package com.ark.center.iam.domain.api.event;

import com.ark.center.iam.domain.common.DomainEventTypes;
import com.ark.component.ddd.domain.event.DomainEvent;
import lombok.Getter;

@Getter
public class ApiCreatedEvent extends DomainEvent {

    private final Long apiId;


    public ApiCreatedEvent(Object source, Long apiId) {
        super(source, DomainEventTypes.API_CREATED.name());
        this.apiId = apiId;
    }
}
