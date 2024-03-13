package com.ark.center.iam.domain.common.hierarchy;

import lombok.Getter;
import lombok.Setter;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.*;
import java.util.stream.Collectors;

import static java.util.Objects.requireNonNull;

public class IdTree {

    @Getter
    @Setter
    private List<IdNode> nodes;

    @Getter
    @Setter
    private Set<String> nodeIds;

    public IdTree() {
        nodes = new ArrayList<>(10);
        nodeIds = new HashSet<>();
    }

    public void addNode(String nodeId) {
        addNode("", nodeId);
    }

    public void addNode(String parentNodeId, String nodeId) {
        requireNonNull(nodeId, "node ID must not be null");

        if (StringUtils.isBlank(parentNodeId)) {
            this.nodes.addFirst(new IdNode(nodeId));
            this.nodeIds.add(nodeId);
            return;
        }

        IdNode idNode = nodeById(parentNodeId);
        if (idNode == null) {
            throw new IdNodeNotFoundException("ID node [" + parentNodeId + "] not found.");
        }
        idNode.addChild(nodeId);
        this.nodeIds.add(nodeId);
    }

    private IdNode nodeById(String nodeId) {
        requireNonNull(nodeId, "node ID must not be null.");

        for (IdNode node : nodes) {
            IdNode idNode = node.nodeById(nodeId);
            if (idNode != null) {
                return idNode;
            }
        }

        return null;
    }

    public boolean removeNode(String nodeId) {
        requireNonNull(nodeId, "nodeId must not be null");

        if (nodes.removeIf(node -> node.getId().equals(nodeId))) {
            nodeIds.remove(nodeId);
            return true;
        }
        for (IdNode node : nodes) {
            if (node.removeChild(nodeId)) {
                nodeIds.remove(nodeId);
                return true;
            }
        }
        return false;
    }

    public String show() {
        StringBuilder stringJoiner = new StringBuilder();
        for (IdNode node : this.nodes) {
            stringJoiner.append(node.getPath());
            stringJoiner.append("\n");
            stringJoiner.append(node.show());
            stringJoiner.append("-----------------------------\n");
        }
        return stringJoiner.toString();
    }

    public IdNode byId(String nodeId) {
        requireNonNull(nodeId, "nodeId must not be null");

        for (IdNode node : nodes) {
            if (node.getId().equals(nodeId)) {
                return node;
            }
        }

        for (IdNode node : nodes) {
            IdNode idNode = node.nodeById(nodeId);
            if (idNode != null) {
                return idNode;
            }
        }
        return null;
    }

    public Set<String> allNodeIds() {
        return nodeIds;
    }

    /**
     * 获取所有的树节点
     */
    public List<IdNode> allNodes() {
        return nodes.stream()
                .flatMap(n -> n.allNodes().stream())
                .collect(Collectors.toList());
    }

    @Getter
    @Setter
    public static class IdNode {

        public static final String NODE_ID_SEPARATOR = "/";

        private String id;

        private Integer level;

        private String path;

        private IdNode parent;

        private List<IdNode> children;

        public IdNode() {
        }

        public IdNode(String id, Integer level, IdNode parentNode) {
            this.id = id;
            this.level = level;
            this.children = new ArrayList<>(10);
            this.parent = parentNode;
            this.path = parentNode.getPath() + this.id + NODE_ID_SEPARATOR;
        }

        public IdNode(String id) {
            this.id = id;
            this.level = 1;
            this.children = new ArrayList<>(10);
            this.path = this.id + NODE_ID_SEPARATOR;
        }

        public IdNode nodeById(String nodeId) {
            requireNonNull(nodeId, "nodeId must not be null");

            if (nodeId.equals(this.id)) {
                return this;
            }
            if (CollectionUtils.isNotEmpty(children)) {
                for (IdNode child : children) {
                    return child.nodeById(nodeId);
                }
            }
            return null;
        }

        private void addChild(String nodeId) {
            requireNonNull(nodeId, "nodeId must not be null");
            this.children.add(new IdNode(nodeId, this.level + 1, this));
        }

        public boolean removeChild(String nodeId) {
            requireNonNull(nodeId, "nodeId must not be null");

            if (this.children.removeIf(idNode -> Objects.equals(nodeId, idNode.id))) {
                return true;
            }

            for (IdNode child : children) {
                if (child.removeChild(nodeId)) {
                    return true;
                }
            }

            return false;
        }

        public String show() {
            StringBuilder stringJoiner = new StringBuilder();
            for (IdNode child : this.children) {
                stringJoiner.append(child.getPath());
                stringJoiner.append("\n");
                stringJoiner.append(child.show());
            }
            return stringJoiner.toString();
        }

        /**
         * 获取所有子节点以及节点自身
         */
        public List<IdNode> allNodes() {
            List<IdNode> ns = this.children.stream()
                    .flatMap(child -> child.allNodes().stream())
                    .collect(Collectors.toList());
            ns.add(this);
            return ns;
        }
    }
}
