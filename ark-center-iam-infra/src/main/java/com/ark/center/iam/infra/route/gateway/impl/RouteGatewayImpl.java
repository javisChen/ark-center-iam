package com.ark.center.iam.infra.route.gateway.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.client.menu.dto.RouteDetailsDTO;
import com.ark.center.iam.client.menu.query.MenuQuery;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.gateway.RouteGateway;
import com.ark.center.iam.infra.route.assembler.RouteAssembler;
import com.ark.center.iam.infra.route.db.MenuMapper;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.ark.component.tree.AbstractTreeService;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class RouteGatewayImpl extends ServiceImpl<MenuMapper, Menu> implements RouteGateway {

    private final RouteAssembler routeAssembler;

    @Override
    public List<UserRouteDTO> selectByRouteIds(List<Long> routeIds) {
        if (CollectionUtil.isEmpty(routeIds)) {
            return Collections.emptyList();
        }
        List<Menu> menus = lambdaQuery()
                .in(Menu::getId, routeIds)
                .orderByAsc(Lists.newArrayList(Menu::getLevel, Menu::getSequence))
                .list();
        return routeAssembler.toRouteDTO(menus);
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
//        addNode(menu);
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
    public RouteDetailsDTO selectDetailsByRouteId(Long id) {
        return baseMapper.selectDetails(id);
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
                .in(BaseEntity::getId, ids)
                .set(Menu::getIsDeleted, DeletedEnums.NOT.getCode())
                .update();
    }

}
