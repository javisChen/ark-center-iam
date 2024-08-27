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
    }

}
