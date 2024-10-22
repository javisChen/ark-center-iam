package com.ark.center.iam.infra.menu.gateway.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.client.menu.dto.RouteDetailsDTO;
import com.ark.center.iam.client.menu.query.MenuQuery;
import com.ark.center.iam.client.user.dto.UserMenuDTO;
import com.ark.center.iam.infra.element.Element;
import com.ark.center.iam.infra.element.assembler.ElementAssembler;
import com.ark.center.iam.infra.menu.gateway.ElementGateway;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.gateway.MenuGateway;
import com.ark.center.iam.infra.menu.assembler.RouteAssembler;
import com.ark.center.iam.infra.menu.db.MenuMapper;
import com.ark.center.iam.infra.permission.enums.PermissionType;
import com.ark.center.iam.infra.permission.gateway.PermissionGateway;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class MenuService extends ServiceImpl<MenuMapper, Menu> implements MenuGateway {

    private final RouteAssembler routeAssembler;
    private final ElementGateway elementGateway;
    private final ElementAssembler elementAssembler;
    private final PermissionGateway permissionGateway;


    @Override
    public List<UserMenuDTO> selectByRouteIds(List<Long> routeIds) {
        return null;
//        if (CollectionUtil.isEmpty(routeIds)) {
//            return Collections.emptyList();
//        }
//        List<Menu> menus = lambdaQuery()
//                .in(Menu::getId, routeIds)
//                .orderByAsc(Lists.newArrayList(Menu::getLevel, Menu::getSequence))
//                .list();
//        return routeAssembler.toUserMenuDTO(menus);
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
    public Menu selectBaseByRouteId(Long id) {
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
    public void updateStatusById(Integer status, Long id) {

    }

    @Override
    public List<Menu> selectSubRoutesByLevelPath(String levelPath) {
        return lambdaQuery()
//                .likeRight(Menu::getLevelPath, levelPath)
                .list();
    }

    @Override
    public void logicDeleteBatchByIds(List<Long> ids) {
        lambdaUpdate()
                .in(BaseEntity::getId, ids)
                .remove();
    }

    @Transactional(rollbackFor = Throwable.class)
    public void saveElements(Long menuId, List<MenuCommand.Element> elements) {

        elementGateway.deleteByMenuId(menuId);

        if (CollectionUtils.isEmpty(elements)) {
            return;
        }

        if (CollectionUtil.isNotEmpty(elements)) {
            List<Element> elementEos = elements.stream().map(item -> {
                Element elementDO = elementAssembler.toElementDO(item, menuId);
                elementDO.setMenuId(menuId);
                return elementDO;
            }).toList();

            for (Element element : elementEos) {
                elementGateway.insert(element);
                permissionGateway.insertPermission(element.getId(), PermissionType.PAGE_ELEMENT);
            }

        }

    }
}
