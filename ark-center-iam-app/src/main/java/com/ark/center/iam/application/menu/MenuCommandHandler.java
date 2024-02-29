package com.ark.center.iam.application.menu;

import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.element.repository.ElementRepository;
import com.ark.center.iam.domain.element.service.ElementFactory;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.MenuFactory;
import com.ark.center.iam.domain.menu.repository.MenuRepository;
import com.ark.center.iam.domain.menu.service.MenuDomainService;
import com.ark.center.iam.domain.element.vo.ElementType;
import com.ark.center.iam.domain.menu.vo.MenuType;
import com.ark.center.iam.model.menu.command.MenuCreateCommand;
import com.ark.center.iam.model.menu.command.MenuHierarchyChangeCommand;
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
    private final MenuDomainService menuDomainService;
    private final ElementFactory elementFactory;
    private final ElementRepository elementRepository;

    @Transactional(rollbackFor = Throwable.class)
    public void create(MenuCreateCommand command) {

        Menu parentMenu = command.getPid() > 0 ? menuRepository.byId(command.getPid()) : null;

        List<Element> elements = command.getElements().stream()
                .map(e -> elementFactory.create(e.getName(), ElementType.from(e.getType())))
                .toList();

        Menu menu = menuFactory.create(command.getName(),
                command.getApplicationId(),
                command.getCode(),
                command.getComponent(),
                MenuType.from(command.getType()),
                command.getHideChildren(),
                command.getSequence(),
                command.getPath(),
                command.getIcon(),
                elements.stream().map(Element::getId).collect(Collectors.toList()),
                parentMenu);

        menuRepository.saveAndPublishEvents(menu);

        elementRepository.saveAndPublishEvents(elements);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void update(MenuUpdateCommand command) {

        Menu parentMenu = command.getPid() > 0 ? menuRepository.byIdOrThrowError(command.getPid(), "上级菜单不存在") : null;

        Menu menu = menuRepository.byIdOrThrowError(command.getId(), "菜单不存在");
        
        List<Element> newElements = command.getElements().stream()
                .filter(e -> e.getId() == null)
                .map(e -> elementFactory.create(e.getName(), ElementType.from(e.getType())))
                .toList();

        List<Long> originalElements = command.getElements().stream()
                .map(MenuUpdateCommand.Element::getId)
                .filter(Objects::nonNull)
                .toList();

        menu.addElements(newElements.stream().map(Element::getId).toList());

        menu.removeElements(originalElements);


        // 更新菜单基础信息
        menuDomainService.update(menu, command.getName(),
                command.getApplicationId(),
                command.getCode(),
                command.getComponent(),
                MenuType.from(command.getType()),
                command.getHideChildren(),
                command.getSequence(),
                command.getPath(),
                EnableDisableStatus.from(command.getStatus()),
                command.getIcon(),
                newElements,
                parentMenu);
        
        // 增加新元素
        
        // 删除元素

        menuRepository.saveAndPublishEvents(menu);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void changeHierarchy(MenuHierarchyChangeCommand command) {

        Menu parentMenu = menuRepository.byIdOrThrowError(command.getPid(), "上级菜单不存在");

        Menu menu = menuRepository.byIdOrThrowError(command.getPid(), "菜单不存在");

        menu.changeHierarchy(parentMenu);

        menuRepository.saveAndPublishEvents(menu);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void changeStatus(MenuUpdateCommand command) {

        Menu menu = menuRepository.byId(command.getId());

        menu.updateStatus(EnableDisableStatus.from(command.getStatus()));

        menuRepository.saveAndPublishEvents(menu);
    }

    @Transactional(rollbackFor = Throwable.class)
    public void delete(Long id) {
        Menu menu = menuRepository.byId(id);

        menu.onDelete();

        menuRepository.deleteAndPublishEvents(menu);
    }

}
