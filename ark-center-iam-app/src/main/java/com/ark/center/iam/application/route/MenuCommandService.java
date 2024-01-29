package com.ark.center.iam.application.route;

import com.ark.center.iam.application.route.executor.*;
import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.client.menu.command.MenuModifyParentCommand;
import com.ark.center.iam.domain.route.Menu;
import com.ark.center.iam.domain.route.gateway.MenuRepository;
import com.ark.center.iam.domain.route.service.RouteCheckService;
import com.ark.center.iam.domain.route.service.RouteService;
import com.ark.center.iam.infra.route.assembler.MenuAssembler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class MenuCommandService {

    private final RouteCreateCmdExe routeCreateCmdExe;
    private final RouteUpdateCmdExe routeUpdateCmdExe;
    private final RouteDeleteCmdExe routeDeleteCmdExe;
    private final RouteCheckService routeCheckService;
    private final MenuRepository menuRepository;
    private final RouteService routeService;
    private final MenuAssembler menuAssembler;

    @Transactional(rollbackFor = Throwable.class)
    public void saveRoute(MenuCommand cmd) {
        routeCreateCmdExe.execute(cmd);
    }

    @Transactional(rollbackFor = Throwable.class)
    public void updateRoute(MenuCommand dto) {
        routeUpdateCmdExe.execute(dto);
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
