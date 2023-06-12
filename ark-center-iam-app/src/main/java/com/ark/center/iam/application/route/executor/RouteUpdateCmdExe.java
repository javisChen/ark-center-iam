package com.ark.center.iam.application.route.executor;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.client.route.command.RouteCmd;
import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.element.gateway.ElementGateway;
import com.ark.center.iam.domain.element.service.ElementService;
import com.ark.center.iam.domain.route.Route;
import com.ark.center.iam.domain.route.common.RouteConst;
import com.ark.center.iam.domain.route.gateway.RouteGateway;
import com.ark.center.iam.domain.route.service.RouteCheckService;
import com.ark.center.iam.domain.route.service.RouteService;
import com.ark.center.iam.infra.resource.assembler.ElementAssembler;
import com.ark.center.iam.infra.resource.assembler.RouteAssembler;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class RouteUpdateCmdExe {

    private final RouteCheckService routeCheckService;
    private final RouteService routeService;
    private final RouteAssembler routeAssembler;
    private final RouteGateway routeGateway;
    private final ElementGateway elementGateway;
    private final ElementService elementService;
    private final ElementAssembler elementAssembler;

    public void execute(RouteCmd dto) {
        Long routeId = dto.getId();

        // 基础校验
        baseCheck(dto);

        // 更新路由基础信息
        updateBase(dto);

        // 更新子路由状态
        tryUpdateChildrenStatus(routeId, dto.getStatus());

        // 尝试移动层级
        tryMoveLevel(routeId, dto.getPid());

        // 清除路由下的页面元素
        clearRouteElements(routeId);

        // 保存页面元素
        saveElements(dto, routeId);

    }

    private void updateBase(RouteCmd dto) {
        Route route = routeAssembler.toRouteDO(dto);
        routeGateway.updateByRouteId(route);
    }

    private void clearRouteElements(Long routeId) {
        elementGateway.deleteByRouteId(routeId);
    }

    private void saveElements(RouteCmd cmd, Long routeId) {
        List<RouteCmd.Element> elements = cmd.getElements();
        if (CollectionUtils.isEmpty(elements)) {
            return;
        }
        elementService.saveBatchElements(elements.stream().map(item -> {
            Element elementDO = elementAssembler.toElementDO(item, routeId);
            elementDO.setRouteId(routeId);
            return elementDO;
        }).toList());
    }

    /**
     * 尝试更新子路由状态
     */
    public void tryUpdateChildrenStatus(Long routeId, Integer status) {
        routeService.updateRouteStatus(routeId, status);
    }

    /**
     * 根据pid是否有变动确定是否需要变更移动层级
     *
     * @param fromRouteId 原路由id
     * @param toRouteId   所属路由id
     */
    private void tryMoveLevel(Long fromRouteId, Long toRouteId) {
        Route route = routeGateway.selectBaseByRouteId(fromRouteId);
        Long oldPid = route.getPid();
        // 如果pid不一致的话才做更新
        if (!oldPid.equals(toRouteId)) {

            Route parentRoute = toRouteId.equals(RouteConst.DEFAULT_PID) ? defaultParentRoute() : routeGateway.selectBaseByRouteId(toRouteId);
            updateRouteLevel(route, parentRoute);

            List<Route> children = getChildrenRouteByLevelPath(route.getLevelPath());
            updateRouteChildrenLevel(parentRoute, children);
        }
    }

    private Route defaultParentRoute() {
        Route route = new Route();
        route.setId(0L);
        route.setPid(0L);
        route.setLevelPath("");
        route.setLevel(0);
        return route;
    }

    private void updateRouteChildrenLevel(Route parentRoute, List<Route> children) {
        if (CollectionUtil.isNotEmpty(children)) {
            List<Route> collect = children.stream().map(item -> {
                Route route = new Route();
                route.setId(item.getId());
                route.setLevel(parentRoute.getLevel() + 1);
                route.setLevelPath(createChildLevelPath(item.getId(), item.getLevelPath(), parentRoute.getLevelPath()));
                return route;
            }).collect(Collectors.toList());
            routeGateway.updateBatchByRouteId(collect);
        }
    }

    private String createChildLevelPath(Long oldRoutePid, String oldRouteLevelPath,
                                        String newParentRouteLevelPath) {
        // 如果当前路由是"64.65.66." 父路由id是"65"，那么该值就是"64."，把该值替换成当前修改的父级路由的level_path
        String partOfOldParent = StringUtils.substringBefore(oldRouteLevelPath, String.valueOf(oldRoutePid));
        return StringUtils.replace(oldRouteLevelPath, partOfOldParent, newParentRouteLevelPath);
    }

    private List<Route> getChildrenRouteByLevelPath(String levelPath) {
        return routeGateway.selectByLevelPath(levelPath);
    }

    /**
     * 更新路由的层级信息
     */
    private void updateRouteLevel(Route route, Route parentRoute) {
        Route newRoute = new Route();
        newRoute.setId(route.getId());
        newRoute.setPid(parentRoute.getId());
        String routeLevelPath = route.getLevelPath();
        String parentRouteLevelPath = parentRoute.getLevelPath();
        String levelPath = route.isFirstLevel() ? (parentRouteLevelPath + routeLevelPath)
                : createNewLevelPath(route.getId(), routeLevelPath, parentRouteLevelPath);
        newRoute.setLevelPath(levelPath);
        newRoute.setLevel(parentRoute.getLevel() + 1);
        routeGateway.updateByRouteId(newRoute);
    }

    private String createNewLevelPath(Long oldRouteId, String oldRouteLevelPath, String parentRouteLevelPath) {
        String partOfOldParent = StringUtils.substringBefore(oldRouteLevelPath, String.valueOf(oldRouteId));
        return StringUtils.replace(oldRouteLevelPath, partOfOldParent, parentRouteLevelPath);
    }


    private void baseCheck(RouteCmd dto) {
        routeCheckService.ensureNameNotExists(dto.getName(), dto.getId());
        routeCheckService.ensureCodeNotExists(dto.getCode(), dto.getId());
    }

}
