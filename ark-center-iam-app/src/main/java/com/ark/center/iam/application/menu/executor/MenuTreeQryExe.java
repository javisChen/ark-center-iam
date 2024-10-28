package com.ark.center.iam.application.menu.executor;

import cn.hutool.core.lang.tree.Tree;
import com.ark.center.iam.infra.menu.gateway.impl.MenuTreeService;
import com.ark.center.iam.client.menu.dto.MenuDTO;
import com.ark.center.iam.client.menu.query.MenuQuery;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.assembler.MenuAssembler;
import com.ark.center.iam.infra.menu.db.MenuDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class MenuTreeQryExe {

    private final MenuDAO menuDAO;
    private final MenuTreeService menuTreeService;
    private final MenuAssembler menuAssembler;

    public List<Tree<Long>> execute(MenuQuery query) {
        List<Menu> page = menuDAO.queryByApplicationId(query.getApplicationId());

        List<MenuDTO> menus = menuAssembler.toMenuDTO(page);

        return menuTreeService.transformToTree(menus);

    }

}
