package com.ark.center.iam.application.menu.executor;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.model.menu.dto.RouteDetailsDTO;
import com.ark.center.iam.model.menu.query.MenuQuery;
import com.ark.center.iam.infra.menu.repository.db.MenuMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class RouteTreeQryExe {

    private final MenuMapper menuMapper;

    public Page<RouteDetailsDTO> execute(MenuQuery dto) {
        Page<RouteDetailsDTO> pageResult = getFirstLevelRoutesByPage(dto);
        List<RouteDetailsDTO> firstLevelRoutes = pageResult.getRecords();
        List<RouteDetailsDTO> childrenLevelRoutes = getChildrenRoutes();
        recursionRoutes(firstLevelRoutes, childrenLevelRoutes);
        return pageResult;
    }

    private Page<RouteDetailsDTO> getFirstLevelRoutesByPage(MenuQuery query) {
        return menuMapper.selectDetailsPages(new Page<>(query.getCurrent(), query.getSize()), query);
    }
    
    private List<RouteDetailsDTO> getChildrenRoutes() {
        return menuMapper.selectSubRoutes();
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
