package com.ark.center.iam.infra.menu.repository;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.repository.MenuRepository;
import com.ark.center.iam.domain.menu.vo.MenuElement;
import com.ark.center.iam.infra.menu.converter.MenuAppConverter;
import com.ark.center.iam.infra.menu.converter.MenuDomainConverter;
import com.ark.center.iam.infra.menu.converter.MenuElementDomainConverter;
import com.ark.center.iam.infra.menu.repository.db.MenuDAO;
import com.ark.center.iam.infra.menu.repository.db.MenuDO;
import com.ark.center.iam.infra.menu.repository.db.MenuElementDAO;
import com.ark.center.iam.infra.menu.repository.db.MenuElementDO;
import com.ark.center.iam.model.user.dto.UserRouteDTO;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class MenuRepositoryImpl extends BaseDBRepository<Menu, Long> implements MenuRepository {

    private final MenuDomainConverter menuDomainConverter;
    private final MenuElementDomainConverter elementDomainConverter;
    private final MenuAppConverter appConverter;
    private final MenuDAO menuDAO;
    private final MenuElementDAO menuElementDAO;

    @Override
    public List<UserRouteDTO> selectByRouteIds(List<Long> routeIds) {
        if (CollectionUtil.isEmpty(routeIds)) {
            return Collections.emptyList();
        }
        List<MenuDO> menus = menuDAO.lambdaQuery()
                .in(MenuDO::getId, routeIds)
                .orderByAsc(Lists.newArrayList(MenuDO::getLevel, MenuDO::getSequence))
                .list();
        return appConverter.convert(menus);
    }


    @Override
    protected void save(Menu menu) {
        Long menuId = menu.getId();

        MenuDO menuDO = menuDomainConverter.fromDomain(menu);
        menuDAO.saveOrUpdate(menuDO);

        // 先清除菜单元素再重新保存
        menuElementDAO.deleteByMenuId(menuId);
        if (CollectionUtils.isNotEmpty(menu.getMenuElements())) {
            List<MenuElementDO> menuElements = elementDomainConverter.fromDomain(menu.getMenuElements());
            menuElementDAO.saveBatch(menuElements);
        }

    }

    @Override
    public void delete(Menu ar) {
        menuDAO.removeById(ar.getId());

        menuElementDAO.deleteByMenuId(ar.getId());
    }

    @Override
    public void delete(List<Long> ids) {
    }

    @Override
    public Menu byId(Long menuId) {

        MenuDO menuDO = menuDAO.getById(menuId);

        List<MenuElement> menuElements = elementDomainConverter.toDomain(menuElementDAO.selectByMenuId(menuId));

        List<MenuDO> children = menuDAO.selectChildMenus(menuId);

        return menuDomainConverter.toDomain(menuDO, menuElements, children);
    }

    @Override
    public boolean existsByName(Long excludeId, String name) {
        return menuDAO.lambdaQuery()
                .ne(excludeId != null, BaseEntity::getId, excludeId)
                .eq(MenuDO::getName, name)
                .exists();
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
