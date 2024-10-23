package com.ark.center.iam.application.menu.executor;

import com.ark.center.iam.application.menu.MenuTreeService;
import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.infra.element.Element;
import com.ark.center.iam.infra.element.service.ElementService;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.assembler.MenuAssembler;
import com.ark.center.iam.infra.menu.gateway.MenuGateway;
import com.ark.center.iam.infra.menu.service.MenuCheckService;
import com.ark.center.iam.infra.permission.enums.PermissionType;
import com.ark.center.iam.infra.permission.service.PermissionService;
import com.ark.center.iam.infra.element.assembler.ElementAssembler;
import com.ark.center.iam.infra.menu.gateway.impl.MenuService;
import com.ark.component.tree.TreeService;

import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;


@Component
@RequiredArgsConstructor
public class MenuCreateCmdExe {

    private final MenuCheckService menuCheckService;

    private final MenuAssembler menuAssembler;

    private final MenuGateway menuGateway;

    private final MenuService menuService;

    private final ElementAssembler elementAssembler;

    private final ElementService elementService;

    private final PermissionService permissionService;

    private final TreeService treeService;

    private final MenuTreeService menuTreeService;

    public void execute(MenuCommand command) {
        baseCheck(command);

        Menu menu = menuAssembler.toMenuDO(command);
        menuService.save(menu);

        menuTreeService.addNode(menu, command.getPid());

//        Menu parentMenu = null;
//        if (menu.isFirstLevel()) {
//            menu.setLevel(RouteConst.FIRST_LEVEL);
//        } else {
//            parentMenu = routeGateway.selectBaseByRouteId(menu.getPid());
//            if (parentMenu == null) {
//                throw ExceptionFactory.userException("父级路由不存在");
//            }
//            menu.setLevel(parentMenu.getLevel() + 1);
//        }
//
//        // 新增完路由记录后再更新层级信息
//        updateLevelPathAfterSave(menu, parentMenu);
        // 添加到权限
        Long routeId = menu.getId();

        permissionService.addPermission(routeId, PermissionType.FRONT_ROUTE);

        // 添加页面元素
        saveElements(command, routeId);
    }

    private void saveElements(MenuCommand command, Long routeId) {
        List<MenuCommand.Element> elements = command.getElements();
        if (CollectionUtils.isEmpty(elements)) {
            return;
        }
        List<Element> elementList = elements.stream()
                .map(item -> elementAssembler.toElementDO(item, routeId))
                .toList();
        elementService.saveBatchElements(elementList);
    }

//    private void updateLevelPathAfterSave(Menu menu, Menu parentMenu) {
//        Long routeId = menu.getId();
//        String levelPath = menu.isFirstLevel()
//                ? routeId + StrUtil.DOT
//                : parentMenu.getLevelPath() + routeId + StrUtil.DOT;
//        Menu entity = new Menu();
//        entity.setId(routeId);
//        entity.setLevelPath(levelPath);
//        menuGateway.updateByRouteId(entity);
//    }

    private void baseCheck(MenuCommand dto) {
        menuCheckService.ensureNameNotExists(dto.getName(), dto.getId());
        menuCheckService.ensureCodeNotExists(dto.getCode(), dto.getId());
    }
}
