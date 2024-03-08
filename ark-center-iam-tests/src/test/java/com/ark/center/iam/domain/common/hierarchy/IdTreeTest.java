package com.ark.center.iam.domain.common.hierarchy;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class IdTreeTest {

    @Test
    void should_create_tree() {
        IdTree idTree = new IdTree();
        idTree.addNode("001");
        System.out.println(idTree.show());
        Assertions.assertEquals(1, idTree.allNodeIds().size());
    }

    @Test
    void should_add_node_children() {
        IdTree idTree = new IdTree();
        idTree.addNode("001");
        idTree.addNode("001", "0011");
        idTree.addNode("001", "0012");
        System.out.println(idTree.show());
        Assertions.assertEquals(3, idTree.allNodeIds().size());
    }

    @Test
    void should_add_nodes_children() {
        IdTree idTree = new IdTree();
        idTree.addNode("001");
        idTree.addNode("002");

        idTree.addNode("001", "0011");
        idTree.addNode("001", "0012");

        idTree.addNode("002", "0021");
        idTree.addNode("002", "0022");

        System.out.println(idTree.show());
        Assertions.assertEquals(6, idTree.allNodeIds().size());
    }

    @Test
    void should_remove_node() {
        IdTree idTree = new IdTree();
        idTree.addNode("001");

        System.out.println(idTree.show());
        Assertions.assertEquals(1, idTree.allNodeIds().size());

        idTree.removeNode("001");
        System.out.println(idTree.show());
        Assertions.assertEquals(0, idTree.allNodeIds().size());
    }

    @Test
    void should_get_all_node_ids() {
        IdTree idTree = new IdTree();
        idTree.addNode("001");
        idTree.addNode("002");

        idTree.addNode("001", "0011");
        idTree.addNode("001", "0012");

        idTree.addNode("002", "0021");
        idTree.addNode("002", "0022");

        System.out.println(idTree.show());
        Assertions.assertEquals(6, idTree.allNodeIds().size());
    }

    @Test
    void should_remove_node_children() {
        IdTree idTree = new IdTree();
        idTree.addNode("001");

        IdTree.IdNode idNode = idTree.byId("001");
        idTree.addNode("001", "0011");
        idTree.addNode("001", "0012");

        idNode.removeChild("0012");

        System.out.println(idTree.show());
        Assertions.assertEquals(1, idNode.getChildren().size());
    }

    @Test
    void should_fail_when_add_node_if_node_is_blank() {
        IdTree idTree = new IdTree();
        idTree.addNode("001");

        Assertions.assertThrows(NullPointerException.class, () -> {
            idTree.addNode(null);
        });
    }

    @Test
    void should_fail_when_add_children_if_parent_node_is_not_exist() {
        IdTree idTree = new IdTree();
        idTree.addNode("001");

        Assertions.assertThrows(IdNodeNotFoundException.class, () -> {
            idTree.addNode("002", "0021");
        });
    }

}