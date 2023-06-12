package com.ark.center.iam.infra.resource.gateway.impl;

import com.ark.center.iam.client.route.dto.RouteDetailsDTO;
import com.ark.center.iam.client.route.query.RouteQry;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.route.gateway.RouteGateway;
import com.ark.center.iam.domain.route.Route;
import com.ark.center.iam.infra.resource.assembler.RouteAssembler;
import com.ark.center.iam.infra.resource.gateway.db.RouteMapper;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class RouteGatewayImpl extends ServiceImpl<RouteMapper, Route> implements RouteGateway {

    private final RouteAssembler routeAssembler;


    @Override
    public List<UserRouteDTO> selectByRouteIds(List<Long> routeIds) {
        List<Route> routes = lambdaQuery()
                .in(Route::getId, routeIds)
                .orderByAsc(Lists.newArrayList(Route::getLevel, Route::getSequence))
                .list();
        return routeAssembler.toRouteDTO(routes);
    }

    @Override
    public Page<RouteDetailsDTO> selectDetailsPage(RouteQry params) {
        return baseMapper.selectDetailsPages(new Page<>(params.getCurrent(), params.getSize()), params);
    }

    @Override
    public List<RouteDetailsDTO> selectSubRoutes() {
        return baseMapper.selectSubRoutes();
    }

    @Override
    public Route selectBaseByRouteId(Long id) {
        return getById(id);
    }

    @Override
    public void insert(Route route) {
        save(route);
    }

    @Override
    public void updateByRouteId(Route entity) {
        updateById(entity);
    }

    @Override
    public void updateStatusByLevelPath(Integer status, String levelPath) {
        LambdaUpdateWrapper<Route> wrapper = new LambdaUpdateWrapper<Route>()
                .likeRight(Route::getLevelPath, levelPath)
                .set(Route::getStatus, status);
        this.update(wrapper);
    }

    @Override
    public void updateBatchByRouteId(List<Route> routes) {
        updateBatchById(routes);
    }

    @Override
    public List<Route> selectByLevelPath(String levelPath) {
        return this.list(new LambdaQueryWrapper<Route>()
                .likeRight(Route::getLevelPath, levelPath));
    }

    @Override
    public RouteDetailsDTO selectDetailsByRouteId(Long id) {
        return baseMapper.selectDetails(id);
    }

    @Override
    public void updateStatusById(Integer status, Long id) {

    }

    @Override
    public List<Route> selectSubRoutesByLevelPath(String levelPath) {
        return lambdaQuery()
                .likeRight(Route::getLevelPath, levelPath)
                .list();
    }

    @Override
    public void logicDeleteBatchByIds(List<Long> ids) {
        lambdaUpdate()
                .in(BaseEntity::getId, ids)
                .set(Route::getIsDeleted, DeletedEnums.NOT.getCode())
                .update();
    }

}
