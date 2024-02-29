package com.ark.center.iam.infra.element.repository;

import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.element.repository.ElementRepository;
import com.ark.center.iam.infra.element.repository.db.MenuElementDAO;
import com.ark.center.iam.infra.element.repository.db.MenuElementDO;
import com.ark.center.iam.infra.element.converter.MenuElementDomainConverter;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ElementDBRepository extends BaseDBRepository<Element, Long> implements ElementRepository {

    private final MenuElementDAO menuElementDAO;
    private final MenuElementDomainConverter domainConverter;

    @Override
    public List<Element> byMenuId(Long menuId) {
        List<MenuElementDO> elementDOS = menuElementDAO.selectByMenuId(menuId);
        return domainConverter.toDomain(elementDOS);
    }

    @Override
    public Element byId(Long aLong) {
        return null;
    }

    @Override
    public void save(Element element) {

    }

    @Override
    public void delete(Element element) {

    }
}
