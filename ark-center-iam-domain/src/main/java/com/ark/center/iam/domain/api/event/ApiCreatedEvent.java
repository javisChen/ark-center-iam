package com.ark.center.iam.domain.api.event;

import lombok.Getter;
import lombok.Setter;
import org.springframework.context.ApplicationEvent;

import java.time.Clock;

@Getter
public class ApiCreatedEvent extends ApplicationEvent {

    private final Long apiId;

    public ApiCreatedEvent(Object source, Long apiId) {
        super(source);
        this.apiId = apiId;
    }

}
