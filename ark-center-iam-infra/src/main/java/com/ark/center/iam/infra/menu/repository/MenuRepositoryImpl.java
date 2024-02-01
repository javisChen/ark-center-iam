package com.ark.center.iam.infra.menu.repository;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.domain.menu.vo.MenuElement;
import com.ark.center.iam.infra.menu.converter.MenuAppConverter;
import com.ark.center.iam.infra.menu.converter.MenuElementDomainConverter;
import com.ark.center.iam.infra.menu.repository.db.MenuDAO;
import com.ark.center.iam.infra.menu.repository.db.MenuDO;
import com.ark.center.iam.infra.menu.repository.db.MenuElementDAO;
import com.ark.center.iam.infra.menu.repository.db.MenuElementDO;
import com.ark.center.iam.model.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.repository.MenuRepository;
import com.ark.center.iam.infra.menu.converter.MenuDomainConverter;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
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
    public Menu selectBaseByRouteId(Long id) {
        MenuDO menuDO = menuDAO.getById(id);

        List<MenuElement> menuElements = elementDomainConverter.toDomain(menuElementDAO.selectByMenuId(id));

        List<MenuDO> children = menuDAO.selectChildMenus(id);

        return menuDomainConverter.convert(menuDO, menuElements, children);
    }

    @Override
    protected void save(Menu menu) {

        Long menuId = menu.getId();

        // 更新菜单基本信息
        MenuDO menuDO = menuDomainConverter.convert(menu);
        menuDAO.saveOrUpdate(menuDO);

        // 先清除菜单元素再重新保存
        menuElementDAO.deleteByMenuId(menuId);
        if (CollectionUtils.isNotEmpty(menu.getMenuElements())) {
            List<MenuElementDO> menuElements = elementDomainConverter.fromDomain(menu.getMenuElements());
            menuElementDAO.saveBatch(menuElements);
        }

    }

    @Override
    protected void delete(Menu it) {

        menuDAO.removeById(it.getId());

        menuElementDAO.deleteByMenuId(it.getId());
    }

    @Override
    protected void delete(List<Long> ids) {
    }

    @Override
    public Menu byId(Long menuId) {

        MenuDO menuDO = menuDAO.getById(menuId);

        List<MenuElement> menuElements = elementDomainConverter.toDomain(menuElementDAO.selectByMenuId(menuId));

        List<MenuDO> children = menuDAO.selectChildMenus(menuId);

        return menuDomainConverter.convert(menuDO, menuElements, children);
    }

    @Override
    public void updateByRouteId(Menu entity) {
        updateById(entity);
    }

    @Override
    public void updateStatusByLevelPath(Integer status, String levelPath) {
        LambdaUpdateWrapper<Menu> wrapper = new LambdaUpdateWrapper<Menu>()
                .likeRight(Menu::getLevelPath, levelPath)
                .set(Menu::getStatus, status);
        this.update(wrapper);
    }

    @Override
    public void updateBatchByRouteId(List<Menu> menus) {
        updateBatchById(menus);
    }

    @Override
    public List<Menu> selectByLevelPath(String levelPath) {
        return this.list(new LambdaQueryWrapper<Menu>()
                .likeRight(Menu::getLevelPath, levelPath));
    }

    @Override
    public void updateStatusById(Integer status, Long id) {

    }

    @Override
    public List<Menu> selectSubRoutesByLevelPath(String levelPath) {
        return lambdaQuery()
                .likeRight(Menu::getLevelPath, levelPath)
                .list();
    }

    @Override
    public void logicDeleteBatchByIds(List<Long> ids) {
        lambdaUpdate()
                .in(AggregateRoot::getId, ids)
                .set(Menu::getIsDeleted, DeletedEnums.NOT.getCode())
                .update();
    }

    @Override
    public boolean existsByName(Long excludeId, String name) {
        return lambdaQuery()
                .ne(excludeId != null, AggregateRoot::getId, excludeId)
                .eq(Menu::getName, name)
                .exists();
    }

    @Override
    public boolean existsByCode(Long excludeId, String code) {
        return lambdaQuery()
                .ne(excludeId != null, AggregateRoot::getId, excludeId)
                .eq(Menu::getCode, code)
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
