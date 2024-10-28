package com.ark.center.iam.infra.menu.gateway;

import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.client.menu.dto.RouteDetailsDTO;
import com.ark.center.iam.client.menu.query.MenuQuery;
import com.ark.center.iam.client.user.dto.UserMenuDTO;
import com.ark.center.iam.infra.menu.Menu;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface MenuGateway {

    List<UserMenuDTO> byIds(List<Long> menuIds);

    Page<RouteDetailsDTO> selectDetailsPage(MenuQuery qry);

    List<RouteDetailsDTO> selectSubRoutes();

    Menu byId(Long id);

    void insert(Menu menu);

    void updateByMenuId(Menu entity);

    void updateStatusByLevelPath(Integer status, String levelPath);

    void updateBatchByRouteId(List<Menu> menus);

    List<Menu> selectByLevelPath(String levelPath);

    RouteDetailsDTO selectDetailsByRouteId(Long id);

    void updateStatusById(Long id, Integer status);

    List<Menu> selectSubRoutesByLevelPath(String levelPath);

    void deleteByIds(List<Long> ids);

    @Transactional(rollbackFor = Throwable.class)
    void saveElements(Long menuId, List<MenuCommand.Element> elements);

    void saveMenu(Menu menu);
}
