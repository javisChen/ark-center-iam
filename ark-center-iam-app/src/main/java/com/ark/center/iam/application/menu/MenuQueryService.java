package com.ark.center.iam.application.menu;

import com.ark.center.iam.application.menu.executor.RouteTreeQryExe;
import com.ark.center.iam.infra.menu.converter.MenuElementAppConverter;
import com.ark.center.iam.infra.menu.repository.db.MenuElementDAO;
import com.ark.center.iam.infra.menu.repository.db.MenuElementDO;
import com.ark.center.iam.infra.menu.repository.db.MenuMapper;
import com.ark.center.iam.model.element.dto.ElementBaseDTO;
import com.ark.center.iam.model.menu.dto.RouteDetailsDTO;
import com.ark.center.iam.model.menu.query.MenuQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MenuQueryService {

    private final RouteTreeQryExe routeTreeQryExe;
    private final MenuElementDAO menuElementDAO;
    private final MenuMapper menuMapper;
    private final MenuElementAppConverter menuElementAppConverter;

    public Page<RouteDetailsDTO> queryPage(MenuQuery dto) {
        return routeTreeQryExe.execute(dto);
    }

    public List<RouteDetailsDTO> queryAll(MenuQuery query) {
        query.setSize(500);
        return queryPage(query).getRecords();
    }

    public RouteDetailsDTO queryDetails(Long id) {
        RouteDetailsDTO routeDetailsDTO = menuMapper.selectDetails(id);
        List<MenuElementDO> menuElements = menuElementDAO.selectByMenuId(id);
        routeDetailsDTO.setElements(menuElementAppConverter.toDTO(menuElements));
        return routeDetailsDTO;
    }

    public List<ElementBaseDTO> queryMenuElements(Long menuId) {
        List<MenuElementDO> menuElementDOS = menuElementDAO.selectByMenuId(menuId);
        return menuElementAppConverter.toDTO(menuElementDOS);
    }
}
