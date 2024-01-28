package com.ark.center.iam.domain.route;

import lombok.Getter;
import org.springframework.context.ApplicationEvent;

@Getter
public class MenuCreatedEvent extends ApplicationEvent {

    private final Long menuId;

    public MenuCreatedEvent(Object source, Long menuId) {
        super(source);
        this.menuId = menuId;
    }

}
