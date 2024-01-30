package com.ark.center.iam.application.menu;

import com.ark.center.iam.application.menu.executor.*;
import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.client.menu.command.MenuModifyParentCommand;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.MenuFactory;
import com.ark.center.iam.domain.menu.repository.MenuRepository;
import com.ark.center.iam.domain.menu.service.RouteCheckService;
import com.ark.center.iam.domain.menu.service.RouteService;
import com.ark.center.iam.domain.menu.vo.MenuType;
import com.ark.center.iam.infra.route.assembler.MenuAssembler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class MenuCommandHandler {

    private final MenuCreateCmdExe menuCreateCmdExe;
    private final MenuUpdateCmdExe menuUpdateCmdExe;
    private final RouteDeleteCmdExe routeDeleteCmdExe;
    private final RouteCheckService routeCheckService;
    private final MenuRepository menuRepository;
    private final RouteService routeService;
    private final MenuAssembler menuAssembler;
    private final MenuFactory menuFactory;

    @Transactional(rollbackFor = Throwable.class)
    public void create(MenuCommand command) {

        Menu parentMenu = null;
        if (command.getPid() > 0) {
            parentMenu = menuRepository.byId(command.getPid());
        }

        Menu menu = menuFactory.create(command.getName(),
                command.getApplicationId(),
                command.getCode(),
                command.getComponent(),
                MenuType.from(command.getType()),
                command.getHideChildren(),
                command.getPid(),
                command.getSequence(),
                command.getPath(),
                command.getIcon(),
                parentMenu);

        menuRepository.persist(menu);
    }

    @Transactional(rollbackFor = Throwable.class)
    public void updateRoute(MenuCommand dto) {
        menuUpdateCmdExe.execute(dto);
    }

    @Transactional(rollbackFor = Throwable.class)
    public void modifyParent(MenuModifyParentCommand cmd) {

        routeCheckService.ensureRouteNotExists(cmd.getId());

        routeCheckService.ensureRouteNotExists(cmd.getPid(), "父级路由不存在");

        Menu menu = menuAssembler.toDomain(cmd);

        menuRepository.updateByRouteId(menu);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void updateRouteStatus(MenuCommand dto) {
        routeService.updateRouteStatus(dto.getId(), dto.getStatus());
    }

    @Transactional(rollbackFor = Throwable.class)
    public void deleteRouteById(Long id) {
        routeDeleteCmdExe.execute(id);
    }

}
