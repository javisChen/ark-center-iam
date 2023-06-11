package com.ark.center.iam.application.route.executor;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.client.route.command.RouteCmd;
import com.ark.center.iam.client.route.dto.PageElementUpdateDTO;
import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.element.gateway.ElementGateway;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.service.PermissionService;
import com.ark.center.iam.domain.route.Route;
import com.ark.center.iam.domain.route.gateway.RouteGateway;
import com.ark.center.iam.domain.route.service.RouteCheckService;
import com.ark.center.iam.infra.resource.assembler.ElementAssembler;
import com.ark.center.iam.infra.resource.assembler.RouteAssembler;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class RouteCreateCmdExe {

    private final static Long DEFAULT_PID = 0L;
    private final static Integer FIRST_LEVEL = 1;

    private final RouteCheckService routeCheckService;
    private final RouteAssembler routeAssembler;
    private final ElementAssembler elementAssembler;

    private final RouteGateway routeGateway;
    private final ElementGateway elementGateway;

    private final PermissionService permissionService;

    public void execute(RouteCmd cmd) {
        baseCheck(cmd);

        Route route = routeAssembler.toRouteDO(cmd);

        Route parentRoute = null;
        if (isFirstLevelRoute(route)) {
            route.setLevel(FIRST_LEVEL);
        } else {
            parentRoute = getRouteById(route.getPid());
            if (parentRoute == null) {
                throw ExceptionFactory.userException("父级路由不存在");
            }
            route.setLevel(parentRoute.getLevel() + 1);
        }
        routeGateway.insert(route);

        // 新增完路由记录后再更新层级信息
        updateLevelPathAfterSave(route, parentRoute);
        // 添加到权限
        permissionService.addPermission(route.getId(), PermissionType.FRONT_ROUTE);
        // 添加页面元素
        saveElements(cmd, route);
    }

    private void saveElements(RouteCmd cmd, Route route) {
        List<RouteCmd.Element> elements = cmd.getElements();
        Long routeId = route.getId();
        if (CollectionUtil.isNotEmpty(elements)) {
            for (RouteCmd.Element element : elements) {
                PageElementUpdateDTO dto = new PageElementUpdateDTO();
                dto.setRouteId(routeId);
                dto.setName(element.getName());
                dto.setType(element.getType());
                Element pageElement = elementAssembler.toElementDO(element);
                elementGateway.insert(pageElement);
                permissionService.addPermission(pageElement.getId(), PermissionType.PAGE_ELEMENT);
            }
        }
    }

    private void updateLevelPathAfterSave(Route route, Route parentRoute) {
        Long routeId = route.getId();
        String levelPath = isFirstLevelRoute(route)
                ? routeId + StrUtil.DOT
                : parentRoute.getLevelPath() + routeId + StrUtil.DOT;
        Route entity = new Route();
        entity.setId(routeId);
        entity.setLevelPath(levelPath);
        routeGateway.updateByRoleId(entity);
    }


    private Route getRouteById(Long id) {
        return routeGateway.selectById(id);
    }
    
    private boolean isFirstLevelRoute(Route route) {
        return DEFAULT_PID.equals(route.getPid()) || FIRST_LEVEL.equals(route.getLevel());
    }

    private void baseCheck(RouteCmd dto) {
        routeCheckService.ensureRecordNotExists(Route::getName, dto.getName(), dto.getId(), "路由名称已存在");
        routeCheckService.ensureRecordNotExists(Route::getCode, dto.getCode(), dto.getId(), "路由编码已存在");
    }
}
