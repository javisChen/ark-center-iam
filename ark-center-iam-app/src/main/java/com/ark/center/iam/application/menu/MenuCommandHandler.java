package com.ark.center.iam.application.menu;

import com.ark.center.iam.application.menu.executor.*;
import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.client.menu.command.RouteModifyParentCmd;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.gateway.MenuGateway;
import com.ark.center.iam.infra.menu.service.MenuCheckService;
import com.ark.center.iam.infra.menu.service.RouteService;
import com.ark.center.iam.infra.menu.assembler.MenuAssembler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class MenuCommandHandler {

    private final MenuCreateCmdExe menuCreateCmdExe;
    private final MenuUpdateCmdExe menuUpdateCmdExe;
    private final MenuDeleteCmdExe menuDeleteCmdExe;
    private final MenuCheckService menuCheckService;
    private final MenuGateway menuGateway;
    private final RouteService routeService;
    private final MenuAssembler menuAssembler;

    @Transactional(rollbackFor = Throwable.class)
    public void save(MenuCommand command) {
        if (command.getId() == null) {
            menuCreateCmdExe.execute(command);
        } else {
            menuUpdateCmdExe.execute(command);
        }
    }

    @Transactional(rollbackFor = Throwable.class)
    public void update(MenuCommand command) {
    }

    @Transactional(rollbackFor = Throwable.class)
    public void modifyParent(RouteModifyParentCmd parentCmd) {

        menuCheckService.ensureRouteNotExists(parentCmd.getId());

        menuCheckService.ensureRouteNotExists(parentCmd.getPid(), "父级路由不存在");

        Menu menu = menuAssembler.toMenuDO(parentCmd);

        menuGateway.updateByMenuId(menu);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void updateRouteStatus(MenuCommand command) {
        routeService.updateRouteStatus(command.getId(), command.getStatus());
    }

    @Transactional(rollbackFor = Throwable.class)
    public void deleteById(Long id) {
        menuDeleteCmdExe.execute(id);
    }

}
