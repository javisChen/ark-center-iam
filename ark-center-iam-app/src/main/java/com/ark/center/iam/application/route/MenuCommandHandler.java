package com.ark.center.iam.application.route;

import com.ark.center.iam.application.route.executor.*;
import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.client.menu.command.RouteModifyParentCmd;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.gateway.MenuGateway;
import com.ark.center.iam.infra.menu.service.MenuCheckService;
import com.ark.center.iam.infra.menu.service.RouteService;
import com.ark.center.iam.infra.route.assembler.RouteAssembler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class MenuCommandHandler {

    private final MenuCreateCmdExe menuCreateCmdExe;
    private final RouteUpdateCmdExe routeUpdateCmdExe;
    private final RouteDeleteCmdExe routeDeleteCmdExe;
    private final MenuCheckService menuCheckService;
    private final MenuGateway menuGateway;
    private final RouteService routeService;
    private final RouteAssembler routeAssembler;

    @Transactional(rollbackFor = Throwable.class)
    public void create(MenuCommand command) {
        menuCreateCmdExe.execute(command);
    }

    @Transactional(rollbackFor = Throwable.class)
    public void update(MenuCommand command) {
        routeUpdateCmdExe.execute(command);
    }

    @Transactional(rollbackFor = Throwable.class)
    public void modifyParent(RouteModifyParentCmd parentCmd) {

        menuCheckService.ensureRouteNotExists(parentCmd.getId());

        menuCheckService.ensureRouteNotExists(parentCmd.getPid(), "父级路由不存在");

        Menu menu = routeAssembler.toMenuDO(parentCmd);

        menuGateway.updateByRouteId(menu);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void updateRouteStatus(MenuCommand command) {
        routeService.updateRouteStatus(command.getId(), command.getStatus());
    }

    @Transactional(rollbackFor = Throwable.class)
    public void deleteById(Long id) {
        routeDeleteCmdExe.execute(id);
    }

}
