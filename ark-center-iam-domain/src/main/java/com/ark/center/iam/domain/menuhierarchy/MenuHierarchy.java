package com.ark.center.iam.domain.menuhierarchy;

import com.ark.center.iam.domain.common.hierarchy.IdTree;
import com.ark.component.ddd.domain.AggregateRoot;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class MenuHierarchy extends AggregateRoot {

    private Long applicationId;

    private IdTree idTree;

    public MenuHierarchy() {
        this.idTree = new IdTree();
    }

    public MenuHierarchy(Long applicationId) {
        this.idTree = new IdTree();
        this.applicationId = applicationId;
    }

    public void addMenu(Long pid, Long menuId) {
        this.idTree.addNode(pid.equals(0L) ? null : String.valueOf(pid), String.valueOf(menuId));
    }

    public void removeMenu(Long menuId) {
        this.idTree.removeNode(String.valueOf(menuId));
    }

    public List<Long> allSubMenuIdsOf(Long menuId) {
        return this.idTree.byId(String.valueOf(menuId))
                .allNodes()
                .stream()
                .filter(node -> !Long.valueOf(node.getId()).equals(menuId))
                .map(node -> Long.valueOf(node.getId()))
                .toList();
    }
}
