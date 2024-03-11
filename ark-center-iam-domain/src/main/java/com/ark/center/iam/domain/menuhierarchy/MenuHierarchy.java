package com.ark.center.iam.domain.menuhierarchy;

import com.ark.center.iam.domain.common.hierarchy.IdTree;
import com.ark.component.ddd.domain.AggregateRoot;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class MenuHierarchy extends AggregateRoot {

    private IdTree idTree;

    public MenuHierarchy() {
        this.idTree = new IdTree();
    }

    public void addMenu(Long pid, Long menuId) {
        this.idTree.addNode(pid.equals(0L) ? null : String.valueOf(pid), String.valueOf(menuId));
    }
}
