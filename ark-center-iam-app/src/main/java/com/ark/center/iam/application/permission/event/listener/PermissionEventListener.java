package com.ark.center.iam.application.permission.event.listener;

import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.event.ApiCreatedEvent;
import com.ark.center.iam.domain.api.ApiRepository;
import com.ark.center.iam.domain.permission.Permission;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.gateway.PermissionGateway;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.MenuCreatedEvent;
import com.ark.center.iam.domain.menu.repository.MenuRepository;
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
    private final ApiRepository apiRepository;
    private final MenuRepository menuRepository;

    @EventListener
    public void onApplicationEvent(@NotNull ApiCreatedEvent event) {
        log.info("app {} created", event.getApiId());

        Api api = apiRepository.byId(event.getApiId());

        permissionGateway.save(new Permission(PermissionType.SER_API, api.getApplicationId(), event.getApiId()));
    }

    @EventListener
    public void onApplicationEvent(@NotNull MenuCreatedEvent event) {
        log.info("menu {} created", event.getMenuId());

        Menu menu = menuRepository.byId(event.getMenuId());

        permissionGateway.save(new Permission(PermissionType.MENU, menu.getApplicationId(), event.getMenuId()));
    }

}
