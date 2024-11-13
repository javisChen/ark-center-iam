package com.ark.center.iam.infra.menu.db;

import com.ark.center.iam.client.menu.dto.MenuDetailDTO;
import com.ark.center.iam.client.menu.query.MenuQuery;
import com.ark.center.iam.infra.menu.Menu;
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

    List<MenuDetailDTO> selectDetailsPages(@Param("params") MenuQuery params);

    List<MenuDetailDTO> selectSubRoutes();

    MenuDetailDTO selectDetails(@Param("id") Long id);
}
