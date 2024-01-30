package com.ark.center.iam.application.menu.executor;

import cn.hutool.core.util.StrUtil;
import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.domain.element.service.ElementService;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.service.PermissionService;
import com.ark.center.iam.domain.menu.Menu;
import com.ark.center.iam.domain.menu.common.MenuConst;
import com.ark.center.iam.domain.menu.repository.MenuRepository;
import com.ark.center.iam.domain.menu.service.RouteCheckService;
import com.ark.center.iam.infra.element.assembler.ElementAssembler;
import com.ark.center.iam.infra.route.assembler.MenuAssembler;
import com.ark.component.exception.ExceptionFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Component
@RequiredArgsConstructor
public class MenuCreateCmdExe {

    private final RouteCheckService routeCheckService;

    private final MenuAssembler menuAssembler;

    private final MenuRepository menuRepository;

    private final ElementAssembler elementAssembler;

    private final ElementService elementService;

    private final PermissionService permissionService;

    public void execute(MenuCommand cmd) {
        baseCheck(cmd);

        Menu menu = menuAssembler.toDomain(cmd);

        Menu parentMenu = null;
        if (menu.isRoot()) {
            menu.setLevel(MenuConst.FIRST_LEVEL);
        } else {
            parentMenu = menuRepository.selectBaseByRouteId(menu.getPid());
            if (parentMenu == null) {
                throw ExceptionFactory.userException("父级路由不存在");
            }
            menu.setLevel(parentMenu.getLevel() + 1);
        }
        menuRepository.insert(menu);

        // 新增完路由记录后再更新层级信息
        updateLevelPathAfterSave(menu, parentMenu);
        // 添加到权限
        Long routeId = menu.getId();
        permissionService.addPermission(routeId, PermissionType.MENU);
        // 添加页面元素
        saveElements(cmd, routeId);
    }

    private void saveElements(MenuCommand cmd, Long routeId) {
        List<MenuCommand.Element> elements = cmd.getElements();
        if (CollectionUtils.isEmpty(elements)) {
            return;
        }
        List<Element> elementList = elements.stream()
                .map(item -> elementAssembler.toElementDO(item, routeId))
                .toList();
        elementService.saveBatchElements(elementList);

    }

    private void updateLevelPathAfterSave(Menu menu, Menu parentMenu) {
        Long menuId = menu.getId();
        String levelPath = menu.isRoot()
                ? menuId + StrUtil.DOT
                : parentMenu.getLevelPath() + menuId + StrUtil.DOT;
        Menu entity = new Menu();
        entity.setId(menuId);
        entity.setLevelPath(levelPath);
        menuRepository.updateByRouteId(entity);
    }

    private void baseCheck(MenuCommand dto) {
        routeCheckService.ensureNameNotExists(dto.getName(), dto.getId());
        routeCheckService.ensureCodeNotExists(dto.getCode(), dto.getId());
    }
}
