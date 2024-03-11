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

import java.util.List;
import java.util.Set;

@Repository
@RequiredArgsConstructor
public class MenuHierarchyDBRepository extends BaseDBRepository<MenuHierarchy, Long> implements MenuHierarchyRepository {

    private final MenuHierarchyDomainConverter domainConverter;

    private final HierarchyDAO hierarchyDAO;

    @Override
    public void save(MenuHierarchy menuHierarchy) {
        IdTree idTree = menuHierarchy.getIdTree();

        Set<String> ids = idTree.allNodeIds();
        if (CollUtil.isNotEmpty(ids)) {
            hierarchyDAO.removeByIds(ids);
        }

        List<IdTree.IdNode> idNodes = idTree.allNodes();
        List<HierarchyDO> menuHierarchies = domainConverter.fromDomain(idNodes);
        hierarchyDAO.saveBatch(menuHierarchies);

    }

    @Override
    public void delete(MenuHierarchy menuHierarchy) {

    }

    @Override
    public MenuHierarchy byId(Long aLong) {
        return null;
    }
}
