package com.ark.center.iam.infra.route.db;

import com.ark.center.iam.client.menu.dto.RouteDetailsDTO;
import com.ark.center.iam.client.menu.query.RouteQuery;
import com.ark.center.iam.domain.menu.Menu;
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
public interface MenuMapper extends BaseMapper<Menu> {

    Page<RouteDetailsDTO> selectDetailsPages(@Param("page") IPage<Menu> page, @Param("params") RouteQuery params);

    List<RouteDetailsDTO> selectSubRoutes();

    RouteDetailsDTO selectDetails(@Param("id") Long id);
}
