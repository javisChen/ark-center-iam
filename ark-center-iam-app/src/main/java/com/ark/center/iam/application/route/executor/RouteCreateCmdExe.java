package com.ark.center.iam.application.route.executor;

import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.client.menu.command.RouteCmd;
import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.element.service.ElementService;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.service.PermissionService;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.common.RouteConst;
import com.ark.center.iam.domain.menu.gateway.RouteGateway;
import com.ark.center.iam.domain.menu.service.RouteCheckService;
import com.ark.center.iam.infra.element.assembler.ElementAssembler;
import com.ark.center.iam.infra.route.assembler.RouteAssembler;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Component
@RequiredArgsConstructor
public class RouteCreateCmdExe {

    private final RouteCheckService routeCheckService;

    private final RouteAssembler routeAssembler;

    private final RouteGateway routeGateway;

    private final ElementAssembler elementAssembler;

    private final ElementService elementService;

    private final PermissionService permissionService;

    public void execute(RouteCmd cmd) {
        baseCheck(cmd);

        Menu menu = routeAssembler.toRouteDO(cmd);

        Menu parentMenu = null;
        if (menu.isFirstLevel()) {
            menu.setLevel(RouteConst.FIRST_LEVEL);
        } else {
            parentMenu = routeGateway.selectBaseByRouteId(menu.getPid());
            if (parentMenu == null) {
                throw ExceptionFactory.userException("父级路由不存在");
            }
            menu.setLevel(parentMenu.getLevel() + 1);
        }
        routeGateway.insert(menu);

        // 新增完路由记录后再更新层级信息
        updateLevelPathAfterSave(menu, parentMenu);
        // 添加到权限
        Long routeId = menu.getId();
        permissionService.addPermission(routeId, PermissionType.FRONT_ROUTE);
        // 添加页面元素
        saveElements(cmd, routeId);
    }

    private void saveElements(RouteCmd cmd, Long routeId) {
        List<RouteCmd.Element> elements = cmd.getElements();
        if (CollectionUtils.isEmpty(elements)) {
            return;
        }
        List<Element> elementList = elements.stream()
                .map(item -> elementAssembler.toElementDO(item, routeId))
                .toList();
        elementService.saveBatchElements(elementList);
    }

    private void updateLevelPathAfterSave(Menu menu, Menu parentMenu) {
        Long routeId = menu.getId();
        String levelPath = menu.isFirstLevel()
                ? routeId + StrUtil.DOT
                : parentMenu.getLevelPath() + routeId + StrUtil.DOT;
        Menu entity = new Menu();
        entity.setId(routeId);
        entity.setLevelPath(levelPath);
        routeGateway.updateByRouteId(entity);
    }

    private void baseCheck(RouteCmd dto) {
        routeCheckService.ensureNameNotExists(dto.getName(), dto.getId());
        routeCheckService.ensureCodeNotExists(dto.getCode(), dto.getId());
    }
}
