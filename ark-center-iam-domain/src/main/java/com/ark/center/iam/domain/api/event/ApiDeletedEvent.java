package com.ark.center.iam.domain.api.event;

import com.ark.center.iam.domain.common.DomainEventTypes;
import com.ark.component.ddd.domain.event.DomainEvent;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApiDeletedEvent extends DomainEvent {

    private final Long apiId;

    public ApiDeletedEvent(Object source, Long apiId) {
        super(source, DomainEventTypes.API_DELETED.name());
        this.apiId = apiId;
    }
}
