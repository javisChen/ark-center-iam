package com.ark.center.iam.application.route.executor;

import com.ark.center.iam.domain.permission.gateway.PermissionGateway;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.gateway.RouteGateway;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class RouteDeleteCmdExe {

    private final RouteGateway routeGateway;
    private final PermissionGateway permissionGateway;

    public void execute(Long id) {
        Menu menu = routeGateway.selectBaseByRouteId(id);

        List<Long> ids = querySubRoutes(menu).stream().map(Menu::getId).collect(Collectors.toList());

        routeGateway.logicDeleteBatchByIds(ids);

        permissionGateway.deleteByResourceIds(ids);
    }

    private List<Menu> querySubRoutes(Menu menu) {
        return routeGateway.selectSubRoutesByLevelPath(menu.getLevelPath());
    }

}
