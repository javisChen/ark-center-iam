package com.ark.center.iam.domain.route.gateway;

import com.ark.center.iam.client.route.dto.RouteDetailsDTO;
import com.ark.center.iam.client.route.query.RouteQry;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.route.Route;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;

public interface RouteGateway {

    List<UserRouteDTO> selectByRouteIds(List<Long> routeIds);

    Page<RouteDetailsDTO> selectDetailsPage(RouteQry qry);

    List<RouteDetailsDTO> selectSubRoutes();

    Route selectBaseByRouteId(Long id);

    void insert(Route route);

    void updateByRouteId(Route entity);

    void updateStatusByLevelPath(Integer status, String levelPath);

    void updateBatchByRouteId(List<Route> routes);

    List<Route> selectByLevelPath(String levelPath);

    RouteDetailsDTO selectDetailsByRouteId(Long id);

    void updateStatusById(Integer status, Long id);

    List<Route> selectSubRoutesByLevelPath(String levelPath);

    void logicDeleteBatchByIds(List<Long> ids);
}
