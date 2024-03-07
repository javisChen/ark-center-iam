package com.ark.center.iam.domain.common.hierarchy;

import lombok.Data;
import org.apache.commons.collections4.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

@Data
public class HierarchyNode {

    private String id;

    private Integer level;

    private String path;

    private List<HierarchyNode> children;

    public HierarchyNode(String id, Integer level) {
        this.id = id;
        this.level = level;
        this.children = new ArrayList<>(0);
    }

    public HierarchyNode nodeById(String id) {
        if (id.equals(this.id)) {
            return this;
        }
        if (CollectionUtils.isNotEmpty(children)) {
            for (HierarchyNode child : children) {
                return child.nodeById(id);
            }
        }
        return null;
    }

    public void addChild(String nodeId) {
        this.children.add(new HierarchyNode(nodeId, this.level + 1));
    }
}
