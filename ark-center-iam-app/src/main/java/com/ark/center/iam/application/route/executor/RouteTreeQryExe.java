package com.ark.center.iam.application.route.executor;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeUtil;
import com.ark.center.iam.client.menu.dto.MenuDTO;
import com.ark.center.iam.client.menu.query.MenuQuery;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.gateway.MenuGateway;
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
public class RouteTreeQryExe {

    private final MenuDAO menuDAO;
    private final TreeService treeService;
    private final RouteAssembler routeAssembler;

    public List<Tree<Long>> execute(MenuQuery dto) {
        List<Menu> page = menuDAO
                .lambdaQuery()
                .eq(dto.getApplicationId() != null, Menu::getApplicationId, dto.getApplicationId())
                .list();

        List<TreeNode> treeNodes = treeService.queryNodes("MENU");

        List<MenuDTO> menuDTO = routeAssembler.toMenuDTO(page);
        // page 转成Map以id为key
        Map<Long, MenuDTO> menuMap = menuDTO.stream().collect(Collectors.toMap(MenuDTO::getId, menu -> menu));

        return TreeUtil.build(treeNodes, 0L, (object, treeNode) -> {
            treeNode.setId(object.getId());
            treeNode.setParentId(object.getParentBizId());
            MenuDTO menu = menuMap.get(object.getBizId());
            if (menu != null) {
                treeNode.setName(menu.getName());
                treeNode.putAll(BeanUtil.beanToMap(menu));
            }
        });

//        // 遍历treeNodes，将其转换成
//        return TreeUtil.build(menuDTO, 0L, (object, treeNode) -> {
//            treeNode.setId(object.getId());
//            treeNode.setParentId(object.getPid());
//            treeNode.setName(object.getName());
//            treeNode.putAll(BeanUtil.beanToMap(object));
//        });
    }

}
