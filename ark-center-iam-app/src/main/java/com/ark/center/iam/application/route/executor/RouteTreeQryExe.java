package com.ark.center.iam.application.route.executor;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeUtil;
import com.ark.center.iam.client.menu.dto.MenuDTO;
import com.ark.center.iam.client.menu.dto.RouteDetailsDTO;
import com.ark.center.iam.client.menu.query.MenuQuery;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.gateway.RouteGateway;
import com.ark.center.iam.infra.route.assembler.RouteAssembler;
import com.ark.center.iam.infra.route.db.MenuDAO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class RouteTreeQryExe {

    private final RouteGateway routeGateway;
    private final MenuDAO menuDAO;
    private final RouteAssembler routeAssembler;

    public List<Tree<Long>> execute(MenuQuery dto) {
        List<Menu> page = menuDAO
                .lambdaQuery()
                .eq(dto.getApplicationId() != null, Menu::getApplicationId, dto.getApplicationId())
                .list();
        List<MenuDTO> menuDTO = routeAssembler.toMenuDTO(page);
        return TreeUtil.build(menuDTO, 0L, (object, treeNode) -> {
            treeNode.setId(object.getId());
            treeNode.setParentId(object.getPid());
            treeNode.setName(object.getName());
            treeNode.putAll(BeanUtil.beanToMap(object));
        });
//        Page<RouteDetailsDTO> pageResult = getFirstLevelRoutesByPage(dto);
//        List<RouteDetailsDTO> firstLevelRoutes = pageResult.getRecords();
//        List<RouteDetailsDTO> childrenLevelRoutes = getChildrenRoutes(firstLevelRoutes);
//        recursionRoutes(firstLevelRoutes, childrenLevelRoutes);
    }

//    private Page<RouteDetailsDTO> getFirstLevelRoutesByPage(MenuQuery params) {
//        return routeGateway.selectDetailsPage(params);
//    }
//
//    private List<RouteDetailsDTO> getChildrenRoutes(List<RouteDetailsDTO> firstLevelRoutes) {
//        return routeGateway.selectSubRoutes();
//    }

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
