package com.ark.center.iam.application.route.executor;

import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.client.route.command.RouteCmd;
import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.element.service.ElementService;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.service.PermissionService;
import com.ark.center.iam.domain.route.Route;
import com.ark.center.iam.domain.route.common.RouteConst;
import com.ark.center.iam.domain.route.gateway.RouteGateway;
import com.ark.center.iam.domain.route.service.RouteCheckService;
import com.ark.center.iam.infra.resource.assembler.ElementAssembler;
import com.ark.center.iam.infra.resource.assembler.RouteAssembler;
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

        Route route = routeAssembler.toRouteDO(cmd);

        Route parentRoute = null;
        if (route.isFirstLevel()) {
            route.setLevel(RouteConst.FIRST_LEVEL);
        } else {
            parentRoute = routeGateway.selectBaseByRouteId(route.getPid());
            if (parentRoute == null) {
                throw ExceptionFactory.userException("父级路由不存在");
            }
            route.setLevel(parentRoute.getLevel() + 1);
        }
        routeGateway.insert(route);

        // 新增完路由记录后再更新层级信息
        updateLevelPathAfterSave(route, parentRoute);
        // 添加到权限
        Long routeId = route.getId();
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

    private void updateLevelPathAfterSave(Route route, Route parentRoute) {
        Long routeId = route.getId();
        String levelPath = route.isFirstLevel()
                ? routeId + StrUtil.DOT
                : parentRoute.getLevelPath() + routeId + StrUtil.DOT;
        Route entity = new Route();
        entity.setId(routeId);
        entity.setLevelPath(levelPath);
        routeGateway.updateByRouteId(entity);
    }

    private void baseCheck(RouteCmd dto) {
        routeCheckService.ensureNameNotExists(dto.getName(), dto.getId());
        routeCheckService.ensureCodeNotExists(dto.getCode(), dto.getId());
    }
}
