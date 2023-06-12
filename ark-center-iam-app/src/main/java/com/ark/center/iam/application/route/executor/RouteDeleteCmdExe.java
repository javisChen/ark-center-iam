package com.ark.center.iam.application.route.executor;

import com.ark.center.iam.domain.permission.gateway.PermissionGateway;
import com.ark.center.iam.domain.route.Route;
import com.ark.center.iam.domain.route.gateway.RouteGateway;
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
        Route route = routeGateway.selectBaseByRouteId(id);

        List<Long> ids = querySubRoutes(route).stream().map(Route::getId).collect(Collectors.toList());

        routeGateway.logicDeleteBatchByIds(ids);

        permissionGateway.deleteByResourceIds(ids);
    }

    private List<Route> querySubRoutes(Route route) {
        return routeGateway.selectSubRoutesByLevelPath(route.getLevelPath());
    }

}
