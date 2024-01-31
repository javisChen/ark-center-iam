package com.ark.center.iam.infra.route.gateway.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.model.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.repository.MenuRepository;
import com.ark.center.iam.infra.route.assembler.MenuAssembler;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class MenuRepositoryImpl extends BaseDBRepository<Menu, Long> implements MenuRepository {

    private final MenuAssembler menuAssembler;

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
