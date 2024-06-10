package com.ark.center.iam.domain.menu.gateway;

import com.ark.center.iam.client.menu.dto.RouteDetailsDTO;
import com.ark.center.iam.client.menu.query.RouteQuery;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.menu.Menu;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;

public interface RouteGateway {

    List<UserRouteDTO> selectByRouteIds(List<Long> routeIds);

    Page<RouteDetailsDTO> selectDetailsPage(RouteQuery qry);

    List<RouteDetailsDTO> selectSubRoutes();

    Menu selectBaseByRouteId(Long id);

    void insert(Menu menu);

    void updateByRouteId(Menu entity);

    void updateStatusByLevelPath(Integer status, String levelPath);

    void updateBatchByRouteId(List<Menu> menus);

    List<Menu> selectByLevelPath(String levelPath);

    RouteDetailsDTO selectDetailsByRouteId(Long id);

    void updateStatusById(Integer status, Long id);

    List<Menu> selectSubRoutesByLevelPath(String levelPath);

    void logicDeleteBatchByIds(List<Long> ids);
}
