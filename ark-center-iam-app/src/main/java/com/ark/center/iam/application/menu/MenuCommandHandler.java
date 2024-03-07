package com.ark.center.iam.application.menu;

import com.ark.center.iam.application.menu.converter.AppElementDomainConverter;
import com.ark.center.iam.application.menu.converter.AppMenuDomainConverter;
import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.element.service.ElementFactory;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.MenuFactory;
import com.ark.center.iam.domain.menu.repository.MenuRepository;
import com.ark.center.iam.domain.menu.service.MenuDomainService;
import com.ark.center.iam.domain.menu.support.MenuDomainDTO;
import com.ark.center.iam.domain.permission.ResourcePermission;
import com.ark.center.iam.domain.permission.repository.ResourcePermissionRepository;
import com.ark.center.iam.domain.permission.vo.PermissionType;
import com.ark.center.iam.model.menu.command.MenuCreateCommand;
import com.ark.center.iam.model.menu.command.MenuUpdateCommand;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MenuCommandHandler {

    private final MenuRepository menuRepository;
    private final MenuFactory menuFactory;
    private final ElementFactory elementFactory;
    private final MenuDomainService menuDomainService;
    private final AppElementDomainConverter elementDomainConverter;
    private final AppMenuDomainConverter menuDomainConverter;
    private final ResourcePermissionRepository resourcePermissionRepository;

    @Transactional(rollbackFor = Throwable.class)
    public void create(MenuCreateCommand command) {

        Menu parent = command.getPid() > 0 ? menuRepository.byId(command.getPid()) : null;

        List<Element> elements = elementDomainConverter.toDomain(command.getElements());

        MenuDomainDTO domainDTO = menuDomainConverter.fromCreate(command, elements, parent);

        Menu menu = menuFactory.create(domainDTO);

        menuRepository.saveAndPublishEvents(menu);

        saveResourcePermission(menu, elements);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void update(MenuUpdateCommand command) {

        Menu parentMenu = command.getPid() > 0 ? menuRepository.byIdOrThrowError(command.getPid(), "上级菜单不存在") : null;

        Menu menu = menuRepository.byIdOrThrowError(command.getId(), "菜单不存在");

        List<Element> elements = elementDomainConverter.toDomain(command.getElements());

        MenuDomainDTO domainDTO = menuDomainConverter.fromUpdate(command, elements, parentMenu);

        // 更新菜单基础信息
        menuDomainService.updateBasic(menu, domainDTO);

        // 删除已移除元素
        List<Long> deletedElementIds = extractDeletedElementIds(elements, menu);
        menu.deleteElements(deletedElementIds);

        // 新增元素
        List<Element> newElements = newElements(elements);
        menu.addElements(newElements);

        // 持久化资源库
        menuRepository.saveAndPublishEvents(menu);

        newElements.stream()
                .map(addedElement -> ResourcePermission.of(PermissionType.MENU_ELEMENT, menu.getApplicationId(), addedElement.getId()))
                .forEach(resourcePermissionRepository::saveAndPublishEvents);

        deletedElementIds.stream()
                .map(deletedElementId -> ResourcePermission.of(PermissionType.MENU_ELEMENT, menu.getApplicationId(), deletedElementId))
                .forEach(resourcePermissionRepository::deleteAndPublishEvents);

    }

    private List<Element> newElements(List<Element> elements) {
        return elements.stream()
                .filter(element -> element.getId() != null)
                .map(element -> elementFactory.create(element.getName(), element.getType()))
                .toList();
    }

    private List<Long> extractDeletedElementIds(List<Element> elements, Menu menu) {
        List<Element> reservedElements = elements.stream()
                .filter(Objects::nonNull)
                .toList();
        return menu.extractDiffElementIds(reservedElements);
    }

//    @Transactional(rollbackFor = Throwable.class)
//    public void changeHierarchy(MenuHierarchyChangeCommand command) {
//
//        Menu parentMenu = menuRepository.byIdOrThrowError(command.getPid(), "上级菜单不存在");
//
//        Menu menu = menuRepository.byIdOrThrowError(command.getPid(), "菜单不存在");
//
//        menu.changeHierarchy(parentMenu);
//
//        menuRepository.saveAndPublishEvents(menu);
//
//    }

    @Transactional(rollbackFor = Throwable.class)
    public void changeStatus(MenuUpdateCommand command) {

        Menu menu = menuRepository.byId(command.getId());

        menu.updateStatus(EnableDisableStatus.from(command.getStatus()));

        menuRepository.saveAndPublishEvents(menu);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void delete(Long id) {
        Menu menu = menuRepository.byId(id);

        menuRepository.deleteAndPublishEvents(menu);

        deleteResourcePermission(menu);

    }

    private void deleteResourcePermission(Menu menu) {
        Long applicationId = menu.getApplicationId();
        ResourcePermission resourcePermission = ResourcePermission.of(PermissionType.MENU, applicationId, menu.getId());
        resourcePermissionRepository.deleteAndPublishEvents(resourcePermission);

        for (Element element : menu.getElements()) {
            ResourcePermission elementPermission = ResourcePermission.of(PermissionType.MENU_ELEMENT, applicationId, element.getId());
            resourcePermissionRepository.deleteAndPublishEvents(elementPermission);
        }
    }

    private void saveResourcePermission(Menu menu, List<Element> elements) {
        Long applicationId = menu.getApplicationId();
        ResourcePermission menuPermission = ResourcePermission.of(PermissionType.MENU, applicationId, menu.getId());
        List<ResourcePermission> permissions = elements.stream()
                .map(element -> ResourcePermission.of(PermissionType.MENU_ELEMENT, applicationId, element.getId()))
                .collect(Collectors.toList());
        permissions.add(menuPermission);
        resourcePermissionRepository.saveAndPublishEvents(permissions);
    }

}
