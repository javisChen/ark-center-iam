package com.ark.center.iam.infra.menu.gateway;

import com.ark.center.iam.client.menu.dto.RouteDetailsDTO;
import com.ark.center.iam.client.menu.query.MenuQuery;
import com.ark.center.iam.client.user.dto.UserMenuDTO;
import com.ark.center.iam.infra.menu.Menu;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;

public interface MenuGateway {

    List<UserMenuDTO> selectByRouteIds(List<Long> routeIds);

    Page<RouteDetailsDTO> selectDetailsPage(MenuQuery qry);

    List<RouteDetailsDTO> selectSubRoutes();

    Menu selectBaseByRouteId(Long id);

    void insert(Menu menu);

    void updateByMenuId(Menu entity);

    void updateStatusByLevelPath(Integer status, String levelPath);

    void updateBatchByRouteId(List<Menu> menus);

    List<Menu> selectByLevelPath(String levelPath);

    RouteDetailsDTO selectDetailsByRouteId(Long id);

    void updateStatusById(Integer status, Long id);

    List<Menu> selectSubRoutesByLevelPath(String levelPath);

    void logicDeleteBatchByIds(List<Long> ids);
}
