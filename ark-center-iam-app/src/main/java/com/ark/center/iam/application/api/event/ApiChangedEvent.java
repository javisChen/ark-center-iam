package com.ark.center.iam.application.api.event;

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
