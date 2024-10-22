package com.ark.center.iam.application.menu.executor;

import com.ark.center.iam.infra.permission.gateway.PermissionGateway;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.gateway.MenuGateway;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class MenuDeleteCmdExe {

    private final MenuGateway menuGateway;
    
    private final PermissionGateway permissionGateway;

    public void execute(Long id) {
        Menu menu = menuGateway.selectBaseByRouteId(id);

        List<Long> ids = querySubRoutes(menu).stream().map(Menu::getId).collect(Collectors.toList());

        menuGateway.logicDeleteBatchByIds(ids);

        permissionGateway.deleteByResourceIds(ids);
    }

    private List<Menu> querySubRoutes(Menu menu) {
//        return menuGateway.selectSubRoutesByLevelPath(menu.getLevelPath());
        return null;
    }

}
