package com.ark.center.iam.application.menu;

import cn.hutool.core.lang.tree.Tree;
import com.ark.center.iam.application.menu.executor.*;
import com.ark.center.iam.client.element.dto.ElementBaseDTO;
import com.ark.center.iam.client.menu.dto.MenuDTO;
import com.ark.center.iam.client.menu.dto.MenuDetailDTO;
import com.ark.center.iam.client.menu.query.MenuQuery;
import com.ark.center.iam.infra.menu.Element;

import com.ark.center.iam.infra.menu.assembler.ElementAssembler;
import com.ark.center.iam.infra.menu.service.ElementService;
import com.ark.center.iam.infra.menu.service.MenuBizTreeService;
import com.ark.center.iam.infra.menu.service.MenuService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MenuQueryService {

    private final MenuTreeQryExe menuTreeQryExe;
    private final MenuBizTreeService menuBizTreeService;
    private final MenuDetailsQryExe menuDetailsQryExe;
    private final ElementService elementService;
    private final ElementAssembler elementAssembler;
    private final MenuService menuService;


    public List<Tree<Long>> queryMenus(MenuQuery dto) {
        return menuTreeQryExe.execute(dto);
    }

    public List<Tree<Long>> queryList(MenuQuery dto) {
        List<MenuDetailDTO> records = menuService.selectDetailsPage(dto);
        return menuBizTreeService.transformToTree(records);
    }


    public MenuDTO queryDetails(Long id) {
        return menuDetailsQryExe.execute(id);
    }


    public List<ElementBaseDTO> queryElementsByMenuId(Long menuId) {
        List<Element> elements = elementService.byMenuId(menuId);
        return elements.stream().map(elementAssembler::toElementDTO).collect(Collectors.toList());
    }
}
