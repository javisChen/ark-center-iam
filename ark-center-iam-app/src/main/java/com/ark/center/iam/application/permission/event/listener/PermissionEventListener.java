package com.ark.center.iam.application.permission.event.listener;

import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.ApiRepository;
import com.ark.center.iam.domain.api.event.ApiCreatedEvent;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.MenuCreatedEvent;
import com.ark.center.iam.domain.menu.MenuDeletedEvent;
import com.ark.center.iam.domain.menu.repository.MenuRepository;
import com.ark.center.iam.domain.permission.ResourcePermission;
import com.ark.center.iam.domain.permission.vo.PermissionType;
import com.ark.center.iam.domain.permission.repository.ResourcePermissionRepository;
import com.ark.center.iam.domain.role.event.RoleDeletedEvent;
import com.ark.center.iam.infra.menu.repository.db.MenuElementDAO;
import com.ark.center.iam.infra.menu.repository.db.MenuElementDO;
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

    private final ResourcePermissionRepository resourcePermissionRepository;
    private final ApiRepository apiRepository;
    private final MenuRepository menuRepository;
    private final MenuElementDAO menuElementDAO;

    @EventListener
    public void onApplicationEvent(@NotNull ApiCreatedEvent event) {
        log.info("app {} was created", event.getApiId());

        Api api = apiRepository.byId(event.getApiId());

        resourcePermissionRepository.saveAndPublishEvents(ResourcePermission.of(PermissionType.SER_API, api.getApplicationId(), event.getApiId()));
    }

    @EventListener
    public void onApplicationEvent(@NotNull MenuCreatedEvent event) {
        log.info("menu {} was created", event.getMenuId());

        Menu menu = menuRepository.byId(event.getMenuId());

        Long applicationId = menu.getApplicationId();

        List<MenuElementDO> menuElementDOS = menuElementDAO.selectByMenuId(menu.getId());

        resourcePermissionRepository.saveAndPublishEvents(ResourcePermission.of(PermissionType.MENU, applicationId, event.getMenuId()));

        menuElementDOS.stream()
                .map(menuElementDO -> ResourcePermission.of(PermissionType.MENU_ELEMENT, applicationId, menuElementDO.getId()))
                .forEach(resourcePermissionRepository::saveAndPublishEvents);

    }

    @EventListener
    public void onApplicationEvent(@NotNull MenuDeletedEvent event) {
        log.info("menus [{}] were deleted", event.getElementIds());

        List<ResourcePermission> menuResourcePermissions = resourcePermissionRepository.byResourceIdsAndType(event.getElementIds(), PermissionType.MENU_ELEMENT);

        List<ResourcePermission> elementResourcePermissions = resourcePermissionRepository.byResourceIdsAndType(event.getMenuIds(), PermissionType.MENU);

        ArrayList<ResourcePermission> resourcePermissions = Lists.newArrayList(menuResourcePermissions);
        resourcePermissions.addAll(elementResourcePermissions);
        resourcePermissionRepository.deleteAll(resourcePermissions);

    }

    @EventListener
    public void onApplicationEvent(@NotNull RoleDeletedEvent event) {
        log.info("role [{}] was deleted", event.getRoleId());

//        List<ResourcePermission> menuResourcePermissions = resourcePermissionRepository.byResourceIdsAndType(event.getElementIds(), PermissionType.MENU_ELEMENT);
//
//        List<ResourcePermission> elementResourcePermissions = resourcePermissionRepository.byResourceIdsAndType(event.getMenuIds(), PermissionType.MENU);
//
//        ArrayList<ResourcePermission> resourcePermissions = Lists.newArrayList(menuResourcePermissions);
//        resourcePermissions.addAll(elementResourcePermissions);
//        resourcePermissionRepository.deleteAll(resourcePermissions);

    }

}
