package com.ark.center.iam.domain.application.event;


import com.ark.center.iam.domain.user.User;
import com.ark.component.ddd.event.DomainEvent;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

@Getter
public class ApplicationCreatedEvent extends DomainEvent {

    private Long appId;

    public ApplicationCreatedEvent(String appId, User user) {

    }
}
