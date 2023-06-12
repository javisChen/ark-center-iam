package com.ark.center.iam.data.route.service;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ark.center.iam.dao.entity.IamRoute;
import com.ark.center.iam.client.route.command.RouteModifyParentCmd;
import com.ark.center.iam.client.route.query.RouteQry;
import com.ark.center.iam.client.route.command.RouteCmd;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.client.route.dto.RouteDetailsDTO;
import com.ark.center.iam.client.element.dto.ElementDetailsDTO;

import java.util.List;

/**
 * <p>
 * 菜单表 服务类
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
public interface IRouteService extends IService<IamRoute> {

    Page<RouteDetailsDTO> pageList(RouteQry pageRequest);

    void saveRoute(RouteCmd dto);

    void updateRoute(RouteCmd dto);

    void updateRouteStatus(RouteCmd dto);

    void modifyParent(RouteModifyParentCmd dto);

    RouteDetailsDTO getRoute(Long id);

    void deleteRouteById(Long id);

    List<RouteDetailsDTO> listAllVOs(RouteQry dto);

    List<ElementDetailsDTO> listRouteElementsById(Long routeId);

    String getRouteNameById(Long pid);

    long countByApplicationId(Long applicationId);

    List<UserRouteDTO> getRouteVOSByIds(List<Long> routeIds);
}
