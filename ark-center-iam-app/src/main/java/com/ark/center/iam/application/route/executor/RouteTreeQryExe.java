package com.ark.center.iam.application.route.executor;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.client.route.dto.RouteListTreeVO;
import com.ark.center.iam.client.route.query.RouteQry;
import com.ark.center.iam.domain.route.gateway.RouteGateway;
import com.ark.center.iam.infra.resource.assembler.RouteAssembler;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class RouteTreeQryExe {

    private final static Long DEFAULT_PID = 0L;
    
    private final static Integer FIRST_LEVEL = 1;
    
    private final RouteAssembler routeAssembler;
    private final RouteGateway routeGateway;
    
    public Page<RouteListTreeVO> execute(RouteQry dto) {
        Page<RouteListTreeVO> pageResult = getFirstLevelRoutesByPage(dto);
        List<RouteListTreeVO> firstLevelRoutes = pageResult.getRecords();
        List<RouteListTreeVO> childrenLevelRoutes = getChildrenRoutes(firstLevelRoutes);
        recursionRoutes(firstLevelRoutes, childrenLevelRoutes);
        return pageResult;
    }

    private Page<RouteListTreeVO> getFirstLevelRoutesByPage(RouteQry params) {
        return routeGateway.selectPage(params);
    }
    
    private List<RouteListTreeVO> getChildrenRoutes(List<RouteListTreeVO> firstLevelRoutes) {
        return routeGateway.selectSubRoutes();
    }

    /**
     * 递归组装路由
     * todo 需要重构
     *
     * @param firstLevelRoutes    一级路由
     * @param childrenLevelRoutes 子路由
     */
    private void recursionRoutes(List<RouteListTreeVO> firstLevelRoutes,
                                 List<RouteListTreeVO> childrenLevelRoutes) {
        List<RouteListTreeVO> vos = CollectionUtil.newArrayList();
        for (RouteListTreeVO item : firstLevelRoutes) {
            item.setChildren(CollectionUtil.newArrayList());
            findChildren(item, childrenLevelRoutes);
            vos.add(item);
        }
    }

    private void findChildren(RouteListTreeVO parent, List<RouteListTreeVO> list) {
        for (RouteListTreeVO route : list) {
            if (parent.getId().equals(route.getPid())) {
                route.setChildren(CollectionUtil.newArrayList());
                parent.getChildren().add(route);
                findChildren(route, list);
            }
        }
    }

}
