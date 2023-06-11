package com.ark.center.iam.domain.route.gateway;

import com.ark.center.iam.client.route.dto.RouteListTreeVO;
import com.ark.center.iam.client.route.query.RouteQry;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.route.Route;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;

public interface RouteGateway {

    List<UserRouteDTO> selectByRouteIds(List<Long> routeIds);

    Page<RouteListTreeVO> selectPage(RouteQry qry);

    List<RouteListTreeVO> selectSubRoutes();

    Route selectById(Long id);

    void insert(Route route);

    void updateByRoleId(Route entity);
}
