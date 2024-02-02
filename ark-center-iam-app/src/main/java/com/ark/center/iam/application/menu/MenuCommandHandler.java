package com.ark.center.iam.application.menu;

import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.MenuFactory;
import com.ark.center.iam.domain.menu.repository.MenuRepository;
import com.ark.center.iam.domain.menu.service.MenuDomainService;
import com.ark.center.iam.domain.menu.vo.ElementType;
import com.ark.center.iam.domain.menu.vo.MenuElement;
import com.ark.center.iam.domain.menu.vo.MenuType;
import com.ark.center.iam.infra.menu.converter.MenuDomainConverter;
import com.ark.center.iam.infra.menu.converter.MenuElementDomainConverter;
import com.ark.center.iam.model.menu.command.MenuCreateCommand;
import com.ark.center.iam.model.menu.command.MenuHierarchyChangeCommand;
import com.ark.center.iam.model.menu.command.MenuUpdateCommand;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class MenuCommandHandler {

    private final MenuRepository menuRepository;
    private final MenuDomainConverter menuDomainConverter;
    private final MenuElementDomainConverter menuElementDomainConverter;
    private final MenuFactory menuFactory;
    private final MenuDomainService menuDomainService;

    @Transactional(rollbackFor = Throwable.class)
    public void create(MenuCreateCommand command) {

        Menu parentMenu = command.getPid() > 0 ? menuRepository.byId(command.getPid()) : null;

        Menu menu = menuFactory.create(command.getName(),
                command.getApplicationId(),
                command.getCode(),
                command.getComponent(),
                MenuType.from(command.getType()),
                command.getHideChildren(),
                command.getSequence(),
                command.getPath(),
                command.getIcon(),
                command.getElements().stream().map(e -> MenuElement.of(e.getName(), ElementType.from(e.getType()))).toList(),
                parentMenu);

        menuRepository.saveAndPublishEvents(menu);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void update(MenuUpdateCommand command) {

        Menu parentMenu = command.getPid() > 0 ? menuRepository.byIdOrThrowError(command.getPid(), "上级菜单不存在") : null;

        Menu menu = menuRepository.byIdOrThrowError(command.getId(), "菜单不存在");

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
                command.getElements().stream().map(e -> MenuElement.of(e.getName(), ElementType.from(e.getType()))).toList(),
                parentMenu);

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
