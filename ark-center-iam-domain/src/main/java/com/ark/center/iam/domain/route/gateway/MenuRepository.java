package com.ark.center.iam.domain.route.gateway;

import com.ark.center.iam.domain.route.Menu;
import com.ark.component.ddd.domain.repository.BaseRepository;

import java.util.List;

public interface MenuRepository extends BaseRepository<Menu, Long> {

    List<UserRouteDTO> selectByRouteIds(List<Long> routeIds);

    Menu selectBaseByRouteId(Long id);

    void insert(Menu menu);

    void updateByRouteId(Menu entity);

    void updateStatusByLevelPath(Integer status, String levelPath);

    void updateBatchByRouteId(List<Menu> menus);

    List<Menu> selectByLevelPath(String levelPath);

    void updateStatusById(Integer status, Long id);

    List<Menu> selectSubRoutesByLevelPath(String levelPath);

    void logicDeleteBatchByIds(List<Long> ids);

    Menu byId(Long menuId);
}
