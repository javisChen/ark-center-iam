package com.ark.center.iam.application.route.executor;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.client.route.dto.RouteDetailsDTO;
import com.ark.center.iam.client.route.query.RouteQuery;
import com.ark.center.iam.domain.route.gateway.RouteGateway;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class RouteTreeQryExe {

    private final RouteGateway routeGateway;
    
    public Page<RouteDetailsDTO> execute(RouteQuery dto) {
        Page<RouteDetailsDTO> pageResult = getFirstLevelRoutesByPage(dto);
        List<RouteDetailsDTO> firstLevelRoutes = pageResult.getRecords();
        List<RouteDetailsDTO> childrenLevelRoutes = getChildrenRoutes(firstLevelRoutes);
        recursionRoutes(firstLevelRoutes, childrenLevelRoutes);
        return pageResult;
    }

    private Page<RouteDetailsDTO> getFirstLevelRoutesByPage(RouteQuery params) {
        return routeGateway.selectDetailsPage(params);
    }
    
    private List<RouteDetailsDTO> getChildrenRoutes(List<RouteDetailsDTO> firstLevelRoutes) {
        return routeGateway.selectSubRoutes();
    }

    /**
     * 递归组装路由
     * todo 需要重构
     *
     * @param firstLevelRoutes    一级路由
     * @param childrenLevelRoutes 子路由
     */
    private void recursionRoutes(List<RouteDetailsDTO> firstLevelRoutes,
                                 List<RouteDetailsDTO> childrenLevelRoutes) {
        List<RouteDetailsDTO> vos = CollectionUtil.newArrayList();
        for (RouteDetailsDTO item : firstLevelRoutes) {
            item.setChildren(CollectionUtil.newArrayList());
            findChildren(item, childrenLevelRoutes);
            vos.add(item);
        }
    }

    private void findChildren(RouteDetailsDTO parent, List<RouteDetailsDTO> list) {
        for (RouteDetailsDTO route : list) {
            if (parent.getId().equals(route.getPid())) {
                route.setChildren(CollectionUtil.newArrayList());
                parent.getChildren().add(route);
                findChildren(route, list);
            }
        }
    }

}
