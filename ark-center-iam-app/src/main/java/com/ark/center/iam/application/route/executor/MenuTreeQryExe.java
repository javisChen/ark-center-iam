package com.ark.center.iam.application.route.executor;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeUtil;
import com.ark.center.iam.client.menu.dto.MenuDTO;
import com.ark.center.iam.client.menu.query.MenuQuery;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.route.assembler.RouteAssembler;
import com.ark.center.iam.infra.route.db.MenuDAO;
import com.ark.component.tree.TreeNode;
import com.ark.component.tree.TreeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class MenuTreeQryExe {

    private final MenuDAO menuDAO;
    private final TreeService treeService;
    private final RouteAssembler routeAssembler;

    public List<Tree<Long>> execute(MenuQuery dto) {
        List<Menu> page = menuDAO
                .lambdaQuery()
                .eq(dto.getApplicationId() != null, Menu::getApplicationId, dto.getApplicationId())
                .list();

        List<MenuDTO> menus = routeAssembler.toMenuDTO(page);

        return treeService.queryTreeNodes("MENU", menus);

    }

}
