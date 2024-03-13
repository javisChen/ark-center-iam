package com.ark.center.iam.infra.menuhierarchy.repository;

import cn.hutool.core.collection.CollUtil;
import com.ark.center.iam.domain.common.hierarchy.IdTree;
import com.ark.center.iam.domain.menuhierarchy.MenuHierarchy;
import com.ark.center.iam.domain.menuhierarchy.MenuHierarchyRepository;
import com.ark.center.iam.infra.menuhierarchy.converter.MenuHierarchyDomainConverter;
import com.ark.center.iam.infra.menuhierarchy.repository.db.HierarchyDAO;
import com.ark.center.iam.infra.menuhierarchy.repository.db.HierarchyDO;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;


@Repository
@RequiredArgsConstructor
public class MenuHierarchyDBRepository extends BaseDBRepository<MenuHierarchy, Long> implements MenuHierarchyRepository {

    private final MenuHierarchyDomainConverter domainConverter;

    private final HierarchyDAO hierarchyDAO;

    @Override
    public void save(MenuHierarchy menuHierarchy) {
        IdTree idTree = menuHierarchy.getIdTree();

        hierarchyDAO.lambdaUpdate()
                .eq(HierarchyDO::getApplicationId, menuHierarchy.getApplicationId())
                .remove();

        List<IdTree.IdNode> idNodes = idTree.allNodes();
        List<HierarchyDO> menuHierarchies = domainConverter.fromDomain(idNodes);
        menuHierarchies.forEach(hierarchyDO -> hierarchyDO.setApplicationId(menuHierarchy.getApplicationId()));
        hierarchyDAO.saveBatch(menuHierarchies);

    }

    @Override
    public void delete(MenuHierarchy menuHierarchy) {

    }

    @Override
    public MenuHierarchy byId(Long aLong) {
        return null;
    }

    @Override
    public MenuHierarchy byApplicationId(Long applicationId) {
        List<HierarchyDO> records = hierarchyDAO.lambdaQuery()
                .eq(HierarchyDO::getApplicationId, applicationId)
                .list();
        if (CollUtil.isEmpty(records)) {
            return null;
        }

        MenuHierarchy menuHierarchy = new MenuHierarchy();
        menuHierarchy.setApplicationId(applicationId);
        IdTree idTree = convertToTree(records);
        menuHierarchy.setIdTree(idTree);
        return menuHierarchy;
    }

    public IdTree convertToTree(List<HierarchyDO> flatList) {
        IdTree tree = new IdTree();

        List<IdTree.IdNode> nodes = new ArrayList<>();
        // 构建节点映射
        for (HierarchyDO hierarchy : flatList) {
            IdTree.IdNode node = new IdTree.IdNode(String.valueOf(hierarchy.getBizId()));
            node.setLevel(hierarchy.getLevel());
            node.setId(String.valueOf(hierarchy.getBizId()));
            node.setPath(hierarchy.getLevelPath());
            node.setLevel(hierarchy.getLevel());
            node.setChildren(new ArrayList<>());
            nodes.add(node);
        }

        Map<Long, IdTree.IdNode> idNodeMap = nodes.stream()
                .collect(Collectors.toMap(node -> Long.valueOf(node.getId()), Function.identity()));

        // 构建树结构
        for (HierarchyDO hierarchy : flatList) {
            IdTree.IdNode node = idNodeMap.get(hierarchy.getBizId());
            if (node != null) {
                Long parentId = hierarchy.getPid();
                if (parentId != null && idNodeMap.containsKey(parentId)) {
                    IdTree.IdNode parent = idNodeMap.get(parentId);
                    node.setParent(parent);
                    parent.getChildren().add(node);
                } else {
                    tree.getNodes().add(node);
                }
            }
        }

        return tree;
    }

}
