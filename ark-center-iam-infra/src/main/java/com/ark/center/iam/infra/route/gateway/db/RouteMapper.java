package com.ark.center.iam.infra.route.gateway.db;

import com.ark.center.iam.client.route.dto.RouteDetailsDTO;
import com.ark.center.iam.client.route.query.RouteQry;
import com.ark.center.iam.domain.route.Route;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 菜单表 Mapper 接口
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
public interface RouteMapper extends BaseMapper<Route> {

    Page<RouteDetailsDTO> selectDetailsPages(@Param("page") IPage<Route> page, @Param("params") RouteQry params);

    List<RouteDetailsDTO> selectSubRoutes();

    RouteDetailsDTO selectDetails(@Param("id") Long id);
}
