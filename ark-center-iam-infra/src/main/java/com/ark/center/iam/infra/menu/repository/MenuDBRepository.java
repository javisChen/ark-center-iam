package com.ark.center.iam.infra.menu.repository;

import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.MenuRepository;
import com.ark.center.iam.infra.element.converter.MenuElementDomainConverter;
import com.ark.center.iam.infra.element.repository.db.MenuElementDAO;
import com.ark.center.iam.infra.element.repository.db.MenuElementDO;
import com.ark.center.iam.infra.menu.converter.MenuDomainConverter;
import com.ark.center.iam.infra.menu.repository.db.MenuDAO;
import com.ark.center.iam.infra.menu.repository.db.MenuDO;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import com.ark.component.orm.mybatis.base.BaseEntity;
import lombok.RequiredArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class MenuDBRepository extends BaseDBRepository<Menu, Long> implements MenuRepository {

    private final MenuDomainConverter menuDomainConverter;
    private final MenuElementDomainConverter elementDomainConverter;
    private final MenuDAO menuDAO;
    private final MenuElementDAO menuElementDAO;

    @Override
    public void save(Menu menu) {
        Long menuId = menu.getId();

        MenuDO menuDO = menuDomainConverter.fromDomain(menu);
        menuDAO.saveOrUpdate(menuDO);

        // 先清除菜单元素再重新保存
        menuElementDAO.deleteByMenuId(menuId);

        if (CollectionUtils.isNotEmpty(menu.getElements())) {
             List<MenuElementDO> menuElements = elementDomainConverter.fromDomain(menu.getElements());
             menuElementDAO.saveBatch(menuElements);
        }

    }

    @Override
    public void delete(Menu ar) {
        menuDAO.removeById(ar.getId());
        menuElementDAO.deleteByMenuId(ar.getId());
    }

    @Override
    public Menu byId(Long menuId) {
        MenuDO menuDO = menuDAO.getById(menuId);
        List<Element> elements = elementDomainConverter.toDomain(menuElementDAO.selectByMenuId(menuId));
        return menuDomainConverter.toDomain(menuDO, elements);
    }

    @Override
    public List<Menu> byIds(List<Long> menuIds) {
        List<MenuDO> menuDOS = menuDAO.listByIds(menuIds);
        if (CollectionUtils.isEmpty(menuDOS)) {
            return Collections.emptyList();
        }
        List<MenuElementDO> elementDOS = menuElementDAO.selectByMenuIds(menuIds);
         Map<Long, List<MenuElementDO>> elementsOfMenu = Collections.emptyMap();
        if (CollectionUtils.isNotEmpty(elementDOS)) {
            elementsOfMenu = elementDOS.stream().collect(Collectors.groupingBy(MenuElementDO::getMenuId));
        }
        List<Menu> menus = new ArrayList<>(menuDOS.size());
        for (MenuDO menu : menuDOS) {
            menus.add(menuDomainConverter.toDomain(menu, elementDomainConverter.toDomain(elementsOfMenu.get(menu.getId()))));
        }
        return menus;
    }

    @Override
    public boolean existsByName(Long excludeId, String name) {
        return menuDAO.lambdaQuery()
                .ne(excludeId != null, BaseEntity::getId, excludeId)
                .eq(MenuDO::getName, name)
                .exists();
    }

    @Override
    public void delete(List<Long> ids) {
        menuDAO.removeByIds(ids);
    }

    @Override
    public boolean existsByCode(Long excludeId, String code) {
        return menuDAO.lambdaQuery()
                .ne(excludeId != null, BaseEntity::getId, excludeId)
                .eq(MenuDO::getCode, code)
                .exists();
    }

    @Override
    public boolean existsByName(String name) {
        return existsByName(null, name);
    }

    @Override
    public boolean existsByCode(String code) {
        return existsByCode(null, code);
    }

}