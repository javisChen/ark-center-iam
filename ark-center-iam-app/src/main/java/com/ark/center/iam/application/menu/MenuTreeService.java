package com.ark.center.iam.application.menu;

import cn.hutool.core.lang.tree.Tree;
import com.ark.center.iam.client.menu.dto.MenuDTO;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.component.tree.TreeNode;
import com.ark.component.tree.TreeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MenuTreeService {

    private final TreeService treeService;

    private final static String BIZ_TYPE = "MENU";


    public TreeNode addNode(Menu menu, Long pid) {
        return treeService.addNode(BIZ_TYPE, menu.getId(), pid, menu.getSequence());
    }

    public List<Tree<Long>> queryTreeNodes(List<MenuDTO> menus) {
        return treeService.queryTreeNodes(BIZ_TYPE, menus);
    }

    public void changeLevel(Long menuId, Long parentMenuId) {
        treeService.move(BIZ_TYPE, menuId, parentMenuId);
    }

    public List<Long> queryChildNodes(Long menuId) {
        return treeService.queryChildNodeBizIds(BIZ_TYPE, menuId);
    }
}
