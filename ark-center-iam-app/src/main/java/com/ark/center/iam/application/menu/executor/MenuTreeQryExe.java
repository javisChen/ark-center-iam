package com.ark.center.iam.application.menu.executor;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.model.menu.dto.MenuDetailsDTO;
import com.ark.center.iam.model.menu.query.MenuQuery;
import com.ark.center.iam.infra.menu.repository.db.MenuMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import java.util.List;

@Component
@RequiredArgsConstructor
public class MenuTreeQryExe {

    private final MenuMapper menuMapper;

    public Page<MenuDetailsDTO> execute(MenuQuery dto) {
        Page<MenuDetailsDTO> pageResult = getFirstLevelRoutesByPage(dto);
        List<MenuDetailsDTO> firstLevelRoutes = pageResult.getRecords();
        List<MenuDetailsDTO> childrenLevelRoutes = getChildrenRoutes();
        recursionRoutes(firstLevelRoutes, childrenLevelRoutes);
        return pageResult;
    }

    private Page<MenuDetailsDTO> getFirstLevelRoutesByPage(MenuQuery query) {
        return menuMapper.selectDetailsPages(new Page<>(query.getCurrent(), query.getSize()), query);
    }
    
    private List<MenuDetailsDTO> getChildrenRoutes() {
        return menuMapper.selectSubRoutes();
    }

    /**
     * 递归组装路由
     * todo 需要重构
     *
     * @param firstLevelRoutes    一级路由
     * @param childrenLevelRoutes 子路由
     */
    private void recursionRoutes(List<MenuDetailsDTO> firstLevelRoutes,
                                 List<MenuDetailsDTO> childrenLevelRoutes) {
        List<MenuDetailsDTO> vos = CollectionUtil.newArrayList();
        for (MenuDetailsDTO item : firstLevelRoutes) {
            item.setChildren(CollectionUtil.newArrayList());
            findChildren(item, childrenLevelRoutes);
            vos.add(item);
        }
    }

    private void findChildren(MenuDetailsDTO parent, List<MenuDetailsDTO> list) {
        for (MenuDetailsDTO route : list) {
            if (parent.getId().equals(route.getPid())) {
                route.setChildren(CollectionUtil.newArrayList());
                parent.getChildren().add(route);
                findChildren(route, list);
            }
        }
    }

}
