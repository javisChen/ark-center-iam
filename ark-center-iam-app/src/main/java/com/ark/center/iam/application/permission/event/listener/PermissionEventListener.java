package com.ark.center.iam.application.permission.event.listener;

import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.ApiRepository;
import com.ark.center.iam.domain.api.event.ApiCreatedEvent;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.MenuCreatedEvent;
import com.ark.center.iam.domain.menu.MenuDeletedEvent;
import com.ark.center.iam.domain.menu.repository.MenuRepository;
import com.ark.center.iam.domain.permission.Permission;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.gateway.PermissionRepository;
import com.ark.center.iam.infra.menu.repository.db.MenuElementDAO;
import com.ark.center.iam.infra.menu.repository.db.MenuElementDO;
import com.ark.center.iam.infra.permission.repository.db.PermissionDAO;
import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@Slf4j
@RequiredArgsConstructor
public class PermissionEventListener {

    private final PermissionRepository permissionRepository;
    private final PermissionDAO permissionDAO;
    private final ApiRepository apiRepository;
    private final MenuRepository menuRepository;
    private final MenuElementDAO menuElementDAO;

    @EventListener
    public void onApplicationEvent(@NotNull ApiCreatedEvent event) {
        log.info("app {} was created", event.getApiId());

        Api api = apiRepository.byId(event.getApiId());

        permissionRepository.save(new Permission(PermissionType.SER_API, api.getApplicationId(), event.getApiId()));
    }

    @EventListener
    public void onApplicationEvent(@NotNull MenuCreatedEvent event) {
        log.info("menu {} was created", event.getMenuId());

        Menu menu = menuRepository.byId(event.getMenuId());

        Long applicationId = menu.getApplicationId();

        List<MenuElementDO> menuElementDOS = menuElementDAO.selectByMenuId(menu.getId());

        permissionRepository.save(new Permission(PermissionType.MENU, applicationId, event.getMenuId()));

        for (MenuElementDO menuElementDO : menuElementDOS) {
            permissionRepository.save(new Permission(PermissionType.MENU_ELEMENT, applicationId, menuElementDO.getId()));
        }

    }

    @EventListener
    public void onApplicationEvent(@NotNull MenuDeletedEvent event) {
        log.info("menus [{}] were deleted", event.getElementIds());

        List<Permission> menuPermissions = permissionRepository.byResourceIdsAndType(event.getElementIds(), PermissionType.MENU_ELEMENT);

        List<Permission> elementPermissions = permissionRepository.byResourceIdsAndType(event.getMenuIds(), PermissionType.MENU);

        ArrayList<Permission> permissions = Lists.newArrayList(menuPermissions);
        permissions.addAll(elementPermissions);
        permissionRepository.deleteAll(permissions);

    }

}
