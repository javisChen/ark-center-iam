//package com.ark.center.iam.application.menu.executor;
//
//import com.ark.center.iam.domain.permission.gateway.PermissionGateway;
//import com.ark.center.iam.domain.menu.Menu;
//import com.ark.center.iam.domain.menu.MenuRepository;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Component;
//
//import java.util.List;
//import java.util.stream.Collectors;
//
//public class RouteDeleteCmdExe {
//
//    private final MenuRepository menuRepository;
//    private final PermissionGateway permissionGateway;
//
//    public void execute(Long id) {
//        Menu menu = menuRepository.byId(id);
//
//        List<Long> ids = querySubRoutes(menu).stream().map(Menu::getId).collect(Collectors.toList());
//
//        menuRepository.logicDeleteBatchByIds(ids);
//
//        permissionGateway.deleteByResourceIds(ids);
//    }
//
//    private List<Menu> querySubRoutes(Menu menu) {
//        return menuRepository.selectSubRoutesByLevelPath(menu.getLevelPath());
//    }
//
//}
