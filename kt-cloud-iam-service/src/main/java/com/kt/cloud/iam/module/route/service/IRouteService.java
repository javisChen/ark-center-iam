package com.kt.cloud.iam.module.route.service;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.kt.cloud.iam.dao.entity.IamRoute;
import com.kt.cloud.iam.module.route.dto.*;
import com.kt.cloud.iam.module.route.vo.RouteDetailVO;
import com.kt.cloud.iam.module.route.vo.RouteElementVO;
import com.kt.cloud.iam.module.route.vo.RouteListTreeVO;
import com.kt.cloud.iam.module.user.vo.UserPermissionRouteNavVO;

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

    Page<RouteListTreeVO> pageList(RouteQueryDTO pageRequest);

    void saveRoute(RouteUpdateDTO dto);

    void updateRoute(RouteUpdateDTO dto);

    void updateRouteStatus(RouteUpdateDTO dto);

    void modifyParent(RouteModifyParentDTO dto);

    RouteDetailVO getRoute(Long id);

    void deleteRouteById(Long id);

    List<RouteListTreeVO> listAllVOs(RouteQueryDTO dto);

    List<RouteElementVO> listRouteElementsById(Long routeId);

    String getRouteNameById(Long pid);

    long countByApplicationId(Long applicationId);

    List<UserPermissionRouteNavVO> getRouteVOSByIds(List<Long> routeIds);
}
