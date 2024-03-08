package com.ark.center.iam.infra.menuhierarchy.repository;

import com.ark.center.iam.domain.common.hierarchy.IdTree;
import com.ark.center.iam.domain.menuhierarchy.MenuHierarchy;
import com.ark.center.iam.domain.menuhierarchy.MenuHierarchyRepository;
import com.ark.center.iam.infra.menuhierarchy.repository.db.HierarchyDAO;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class MenuHierarchyDBRepository extends BaseDBRepository<MenuHierarchy, Long> implements MenuHierarchyRepository {

    private final HierarchyDAO hierarchyDAO;

    @Override
    public void save(MenuHierarchy menuHierarchy) {
        IdTree idTree = menuHierarchy.getIdTree();
//        hierarchyDAO.removeByIds()


    }

    @Override
    public void delete(MenuHierarchy menuHierarchy) {

    }

    @Override
    public MenuHierarchy byId(Long aLong) {
        return null;
    }
}
