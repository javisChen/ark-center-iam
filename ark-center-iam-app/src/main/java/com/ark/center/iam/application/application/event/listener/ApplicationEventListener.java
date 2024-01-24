package com.ark.center.iam.application.application.event.listener;

import com.ark.center.iam.domain.application.event.ApplicationChangedEvent;
import com.ark.center.iam.domain.application.event.ApplicationCreatedEvent;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class ApplicationEventListener {

    @EventListener
    public void onApplicationEvent(@NotNull ApplicationCreatedEvent event) {
        log.info("application {} created", event.getAppId());
    }

    @EventListener
    public void onApplicationEvent(@NotNull ApplicationChangedEvent event) {
        log.info("application {} changed", event.getAppId());
    }

}
