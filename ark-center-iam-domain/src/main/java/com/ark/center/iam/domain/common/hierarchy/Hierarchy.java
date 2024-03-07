package com.ark.center.iam.domain.common.hierarchy;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

import static lombok.AccessLevel.PRIVATE;

@Data
@AllArgsConstructor(access = PRIVATE)
public class Hierarchy {

    private List<HierarchyNode> nodes;

    public Hierarchy() {
        nodes = new ArrayList<>(0);
    }

    public void addNode(String parentNodeId, String nodeId) {
        for (HierarchyNode node : nodes) {
            HierarchyNode hierarchyNode = node.nodeById(parentNodeId);
            if (hierarchyNode != null) {
                hierarchyNode.addChild(nodeId);
            }
        }
    }

}
