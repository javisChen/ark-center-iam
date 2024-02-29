package com.ark.center.iam.application.menu;

import com.ark.center.iam.application.menu.executor.MenuTreeQryExe;
import com.ark.center.iam.infra.element.converter.MenuElementAppConverter;
import com.ark.center.iam.infra.element.repository.db.MenuElementDAO;
import com.ark.center.iam.infra.element.repository.db.MenuElementDO;
import com.ark.center.iam.infra.menu.repository.db.MenuMapper;
import com.ark.center.iam.model.element.dto.ElementBaseDTO;
import com.ark.center.iam.model.menu.dto.MenuDetailsDTO;
import com.ark.center.iam.model.menu.query.MenuQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MenuQueryService {

    private final MenuTreeQryExe menuTreeQryExe;
    private final MenuElementDAO menuElementDAO;
    private final MenuMapper menuMapper;
    private final MenuElementAppConverter menuElementAppConverter;

    public Page<MenuDetailsDTO> queryPage(MenuQuery dto) {
        return menuTreeQryExe.execute(dto);
    }

    public List<MenuDetailsDTO> queryAll(MenuQuery query) {
        query.setSize(500);
        return queryPage(query).getRecords();
    }

    public MenuDetailsDTO queryDetails(Long id) {
        MenuDetailsDTO menuDetailsDTO = menuMapper.selectDetails(id);
        List<MenuElementDO> menuElements = menuElementDAO.selectByMenuId(id);
        menuDetailsDTO.setElements(menuElementAppConverter.toDTO(menuElements));
        return menuDetailsDTO;
    }

    public List<ElementBaseDTO> queryMenuElements(Long menuId) {
        List<MenuElementDO> menuElementDOS = menuElementDAO.selectByMenuId(menuId);
        return menuElementAppConverter.toDTO(menuElementDOS);
    }
}
