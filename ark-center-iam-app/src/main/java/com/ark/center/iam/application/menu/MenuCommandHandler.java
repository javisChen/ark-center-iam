package com.ark.center.iam.application.menu;

import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.MenuFactory;
import com.ark.center.iam.domain.menu.repository.MenuRepository;
import com.ark.center.iam.domain.menu.service.MenuDomainService;
import com.ark.center.iam.domain.menu.service.RouteCheckService;
import com.ark.center.iam.infra.menu.converter.MenuDomainConverter;
import com.ark.center.iam.model.menu.command.MenuCreateCommand;
import com.ark.center.iam.model.menu.command.MenuModifyParentCommand;
import com.ark.center.iam.model.menu.command.MenuUpdateCommand;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class MenuCommandHandler {

    private final RouteCheckService routeCheckService;
    private final MenuRepository menuRepository;
    private final MenuDomainConverter menuDomainConverter;
    private final MenuFactory menuFactory;
    private final MenuDomainService menuDomainService;

    @Transactional(rollbackFor = Throwable.class)
    public void create(MenuCreateCommand command) {

        Menu parentMenu = command.getPid() > 0 ? menuRepository.byId(command.getPid()) : null;

        Menu menuDomain = menuDomainConverter.toDomain(command);

        Menu menu = menuFactory.create(menuDomain, parentMenu);

        menuRepository.saveAndPublishEvents(menu);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void update(MenuUpdateCommand command) {

        Menu parentMenu = command.getPid() > 0 ? menuRepository.byId(command.getPid()) : null;

        Menu willUpdateMenu = menuDomainConverter.toDomain(command);

        Menu menu = menuRepository.byId(command.getId());

        menuDomainService.update(menu, willUpdateMenu, parentMenu);

        menuRepository.saveAndPublishEvents(menu);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void modifyParent(MenuModifyParentCommand command) {

        routeCheckService.ensureRouteNotExists(cmd.getId());

        routeCheckService.ensureRouteNotExists(cmd.getPid(), "上级路由不存在");

        Menu parentMenu = menuRepository.byId(command.getPid());

        Menu menu = menuRepository.byId(command.getId());

        menu.changeHierarchy(parentMenu);

        menuRepository.updateByRouteId(menu);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void changeStatus(MenuUpdateCommand command) {

        Menu menu = menuRepository.byId(command.getId());

        EnableDisableStatus status = EnableDisableStatus.from(command.getStatus());
        menu.changeStatus(status);
        menu.changeChildrenStatus(status);

        menuRepository.saveAndPublishEvents(menu);
    }

    @Transactional(rollbackFor = Throwable.class)
    public void delete(Long id) {
        Menu menu = menuRepository.byId(id);

        menu.onDelete();

        menuRepository.deleteAndPublishEvents(menu);
    }

}
