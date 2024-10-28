package com.ark.center.iam.infra.menu.gateway.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.client.menu.dto.RouteDetailsDTO;
import com.ark.center.iam.client.menu.query.MenuQuery;
import com.ark.center.iam.client.user.dto.UserMenuDTO;
import com.ark.center.iam.infra.element.Element;
import com.ark.center.iam.infra.element.assembler.ElementAssembler;
import com.ark.center.iam.infra.element.service.ElementService;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.gateway.MenuGateway;
import com.ark.center.iam.infra.menu.assembler.MenuAssembler;
import com.ark.center.iam.infra.menu.db.MenuMapper;
import com.ark.center.iam.infra.permission.enums.PermissionType;
import com.ark.center.iam.infra.permission.gateway.impl.PermissionService;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class MenuService extends ServiceImpl<MenuMapper, Menu> implements MenuGateway {

    private final ElementService elementService;
    private final ElementAssembler elementAssembler;
    private final PermissionService permissionService;
    private final MenuTreeService menuTreeService;
    private final MenuAssembler menuAssembler;

    @Override
    public List<UserMenuDTO> byIds(List<Long> menuIds) {
//        return null;
        if (CollectionUtil.isEmpty(menuIds)) {
            return Collections.emptyList();
        }
        List<Menu> menus = lambdaQuery()
                .in(Menu::getId, menuIds)
                .list();
        return menuAssembler.toUserMenuDTO(menus);
    }

    @Override
    public Page<RouteDetailsDTO> selectDetailsPage(MenuQuery params) {
        return baseMapper.selectDetailsPages(new Page<>(params.getCurrent(), params.getSize()), params);
    }

    @Override
    public List<RouteDetailsDTO> selectSubRoutes() {
//        return baseMapper.selectSubRoutes();
        return null;

    }

    @Override
    public Menu byId(Long id) {
        return getById(id);
    }

    @Override
    public void insert(Menu menu) {
        save(menu);
    }

    @Override
    public void updateByMenuId(Menu entity) {
        updateById(entity);
    }

    @Override
    public void updateStatusByLevelPath(Integer status, String levelPath) {
        LambdaUpdateWrapper<Menu> wrapper = new LambdaUpdateWrapper<Menu>()
//                .likeRight(Menu::getLevelPath, levelPath)
                .set(Menu::getStatus, status);
        this.update(wrapper);
    }

    @Override
    public void updateBatchByRouteId(List<Menu> menus) {
        updateBatchById(menus);
    }

    @Override
    public List<Menu> selectByLevelPath(String levelPath) {
//        return this.list(new LambdaQueryWrapper<Menu>()
//                .likeRight(Menu::getLevelPath, levelPath));
        return null;
    }

    @Override
    public RouteDetailsDTO selectDetailsByRouteId(Long id) {
        return baseMapper.selectDetails(id);
    }

    @Override
    public void updateStatusById(Long id, Integer status) {
        Menu entity = new Menu();
        entity.setId(id);
        entity.setStatus(status);
        updateById(entity);
    }

    @Override
    public List<Menu> selectSubRoutesByLevelPath(String levelPath) {
        return lambdaQuery()
//                .likeRight(Menu::getLevelPath, levelPath)
                .list();
    }

    @Override
    public void deleteByIds(List<Long> ids) {
        lambdaUpdate()
                .in(BaseEntity::getId, ids)
                .remove();
    }

    @Transactional(rollbackFor = Throwable.class)
    @Override
    public void saveElements(Long menuId, List<MenuCommand.Element> elements) {

        elementService.deleteByMenuId(menuId);

        if (CollectionUtils.isEmpty(elements)) {
            return;
        }

        List<Element> elementEos = elements.stream().map(item -> {
            Element elementDO = elementAssembler.toElementDO(item, menuId);
            elementDO.setMenuId(menuId);
            return elementDO;
        }).toList();

        for (Element element : elementEos) {
            elementService.save(element);
            permissionService.insertPermission(element.getId(), PermissionType.PAGE_ELEMENT);
        }

    }

    @Override
    public void saveMenu(Menu menu) {
        save(menu);
    }

    public void updateChildrenStatus(Long menuId, Integer status) {
        List<Long> treeNodes = menuTreeService.queryChildNodeIds(menuId);
        if (CollectionUtils.isNotEmpty(treeNodes)) {
            lambdaUpdate()
                    .set(Menu::getStatus, status)
                    .in(BaseEntity::getId, treeNodes)
                    .update();
        }
    }
}
