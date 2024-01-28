package com.ark.center.iam.application.permission.event.listener;

import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.event.ApiCreatedEvent;
import com.ark.center.iam.domain.api.gateway.ApiGateway;
import com.ark.center.iam.domain.application.event.ApplicationChangedEvent;
import com.ark.center.iam.domain.permission.Permission;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.gateway.PermissionGateway;
import com.ark.center.iam.domain.route.MenuCreatedEvent;
import com.ark.center.iam.domain.route.gateway.RouteGateway;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
@Slf4j
@RequiredArgsConstructor
public class PermissionEventListener {

    private final PermissionGateway permissionGateway;
    private final ApiGateway apiGateway;
    private final RouteGateway routeGateway;

    @EventListener
    public void onApplicationEvent(@NotNull ApiCreatedEvent event) {
        log.info("app {} created", event.getApiId());

        Api api = apiGateway.byId(event.getApiId());

        permissionGateway.insert(new Permission(PermissionType.SER_API, api.getApplicationId(), event.getApiId()));
    }


    @EventListener
    public void onApplicationEvent(@NotNull MenuCreatedEvent event) {
        log.info("menu {} created", event.getMenuId());
    }


}
