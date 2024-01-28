package com.ark.center.iam.domain.api.event;

import lombok.Getter;
import lombok.Setter;
import org.springframework.context.ApplicationEvent;

@Getter
@Setter
public class ApiChangedEvent extends ApplicationEvent {

    public ApiChangedEvent(Object source) {
        super(source);
    }

}
