package com.ark.center.iam.infra.route.gateway.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.client.menu.dto.RouteDetailsDTO;
import com.ark.center.iam.client.menu.query.MenuQuery;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.route.Menu;
import com.ark.center.iam.domain.route.gateway.MenuRepository;
import com.ark.center.iam.infra.route.assembler.MenuAssembler;
import com.ark.center.iam.infra.route.gateway.db.MenuMapper;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class MenuRepositoryImpl extends BaseDBRepository<Menu, Long> implements MenuRepository {

    private final MenuAssembler menuAssembler;

    private final MenuMapper menuMapper;

    @Override
    public List<UserRouteDTO> selectByRouteIds(List<Long> routeIds) {
        if (CollectionUtil.isEmpty(routeIds)) {
            return Collections.emptyList();
        }
        List<Menu> menus = lambdaQuery()
                .in(Menu::getId, routeIds)
                .orderByAsc(Lists.newArrayList(Menu::getLevel, Menu::getSequence))
                .list();
        return menuAssembler.toRouteDTO(menus);
    }

    @Override
    public List<RouteDetailsDTO> selectSubRoutes() {
        return baseMapper.selectSubRoutes();
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

    @Override
    public Menu byId(Long menuId) {
        return menuMapper.selectById(menuId);
    }

}
