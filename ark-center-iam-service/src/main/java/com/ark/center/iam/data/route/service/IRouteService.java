package com.ark.center.iam.data.route.service;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ark.center.iam.dao.entity.IamRoute;
import com.ark.center.iam.client.route.dto.RouteModifyParentDTO;
import com.ark.center.iam.client.route.query.RouteQry;
import com.ark.center.iam.client.route.command.RouteCmd;
import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.client.route.dto.RouteDetailVO;
import com.ark.center.iam.client.route.dto.RouteElementVO;
import com.ark.center.iam.client.route.dto.RouteListTreeVO;

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

    Page<RouteListTreeVO> pageList(RouteQry pageRequest);

    void saveRoute(RouteCmd dto);

    void updateRoute(RouteCmd dto);

    void updateRouteStatus(RouteCmd dto);

    void modifyParent(RouteModifyParentDTO dto);

    RouteDetailVO getRoute(Long id);

    void deleteRouteById(Long id);

    List<RouteListTreeVO> listAllVOs(RouteQry dto);

    List<RouteElementVO> listRouteElementsById(Long routeId);

    String getRouteNameById(Long pid);

    long countByApplicationId(Long applicationId);

    List<UserRouteDTO> getRouteVOSByIds(List<Long> routeIds);
}
