package com.ark.center.iam.application.menu.executor;

import cn.hutool.core.lang.tree.Tree;
import com.ark.center.iam.application.menu.MenuTreeService;
import com.ark.center.iam.client.menu.dto.MenuDTO;
import com.ark.center.iam.client.menu.query.MenuQuery;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.assembler.RouteAssembler;
import com.ark.center.iam.infra.menu.db.MenuDAO;
import com.ark.component.tree.TreeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class MenuTreeQryExe {

    private final MenuDAO menuDAO;
    private final TreeService treeService;
    private final MenuTreeService menuTreeService;
    private final RouteAssembler routeAssembler;

    public List<Tree<Long>> execute(MenuQuery dto) {
        List<Menu> page = menuDAO
                .lambdaQuery()
                .eq(dto.getApplicationId() != null, Menu::getApplicationId, dto.getApplicationId())
                .list();

        List<MenuDTO> menus = routeAssembler.toMenuDTO(page);

        return menuTreeService.queryTreeNodes(menus);

    }

}
