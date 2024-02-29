package com.ark.center.iam.infra.menu.repository.db;

import com.ark.center.iam.model.menu.dto.MenuDetailsDTO;
import com.ark.center.iam.model.menu.query.MenuQuery;
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
public interface MenuMapper extends BaseMapper<MenuDO> {

    Page<MenuDetailsDTO> selectDetailsPages(@Param("page") IPage<Menu> page, @Param("params") MenuQuery params);

    List<MenuDetailsDTO> selectSubRoutes();

    MenuDetailsDTO selectDetails(@Param("id") Long id);
}
