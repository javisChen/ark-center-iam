package com.ark.center.iam.infra.resource.gateway.impl;

import com.ark.center.iam.client.route.dto.RouteListTreeVO;
import com.ark.center.iam.client.route.query.RouteQry;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.route.gateway.RouteGateway;
import com.ark.center.iam.domain.route.Route;
import com.ark.center.iam.infra.resource.assembler.RouteAssembler;
import com.ark.center.iam.infra.resource.gateway.db.RouteMapper;
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

    private final static Long DEFAULT_PID = 0L;


    @Override
    public List<UserRouteDTO> selectByRouteIds(List<Long> routeIds) {
        List<Route> routes = lambdaQuery()
                .in(Route::getId, routeIds)
                .orderByAsc(Lists.newArrayList(Route::getLevel, Route::getSequence))
                .list();
        return routeAssembler.toRouteDTO(routes);
    }

    @Override
    public Page<RouteListTreeVO> selectPage(RouteQry params) {
        return baseMapper.selectPages(new Page<>(params.getCurrent(), params.getSize()), params);
    }

    @Override
    public List<RouteListTreeVO> selectSubRoutes() {
        return baseMapper.selectSubRoutes();
    }

    @Override
    public Route selectById(Long id) {
        return getById(id);
    }

    @Override
    public void insert(Route route) {
        save(route);
    }

    @Override
    public void updateByRoleId(Route entity) {
        updateById(entity);
    }


}
