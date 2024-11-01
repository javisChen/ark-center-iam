package com.ark.center.iam.infra.usergroup.service;

import cn.hutool.core.lang.tree.Tree;
import com.ark.center.iam.client.usergroup.command.UserGroupCommand;
import com.ark.component.tree.TreeNode;
import com.ark.component.tree.TreeService;
import com.ark.component.tree.dto.TreeDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserGroupTreeService {

    private final TreeService treeService;

    private final static String BIZ_TYPE = "USER_GROUP";

    public TreeNode addNode(UserGroupCommand command) {
        return treeService.addNode(BIZ_TYPE, command.getId(), command.getParentId(), 0);
    }

    public <T extends TreeDTO<Long>> List<Tree<Long>> transformToTree(List<T> data) {
        return treeService.transformToTree(BIZ_TYPE, data);
    }

    public void changeLevel(Long menuId, Long parentMenuId) {
        treeService.move(BIZ_TYPE, menuId, parentMenuId);
    }

    public List<Long> queryChildNodeIds(Long menuId) {
        return treeService.queryChildNodeBizIds(BIZ_TYPE, menuId);
    }

    public <T extends TreeDTO<Long>> T transformToTreeNode(T menuDTO) {
        return treeService.transformToTreeNode(BIZ_TYPE, menuDTO);
    }

    public List<Long> removeNodeAndChildren(Long bizId) {
        return treeService.removeNodeAndChildren(BIZ_TYPE, bizId);
    }
}
