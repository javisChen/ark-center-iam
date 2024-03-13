package com.ark.center.iam.infra.menuhierarchy.converter;

import com.ark.center.iam.domain.common.hierarchy.IdTree;
import com.ark.center.iam.infra.menuhierarchy.repository.db.HierarchyDO;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface MenuHierarchyDomainConverter {

    default HierarchyDO fromDomain(IdTree.IdNode idNode) {
        HierarchyDO hierarchyDO = new HierarchyDO();
        hierarchyDO.setId(Long.valueOf(idNode.getId()));
        hierarchyDO.setBizType("MENU");
        hierarchyDO.setBizId(Long.valueOf(idNode.getId()));
        if (idNode.getParent() != null) {
            hierarchyDO.setPid(Long.valueOf(idNode.getParent().getId()));
        }
        hierarchyDO.setLevelPath(idNode.getPath());
        hierarchyDO.setLevel(idNode.getLevel());
        return hierarchyDO;
    }

    List<HierarchyDO> fromDomain(List<IdTree.IdNode> idNodes);

}
