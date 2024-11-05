package com.ark.center.iam.application.menu.executor;

import com.ark.center.iam.infra.menu.service.MenuService;
import com.ark.center.iam.infra.menu.service.MenuBizTreeService;
import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.assembler.MenuAssembler;
import com.ark.center.iam.infra.menu.service.MenuCheckService;
import com.ark.center.iam.infra.permission.enums.PermissionType;
import com.ark.center.iam.infra.permission.gateway.impl.PermissionService;

import java.util.List;

import com.ark.component.tree.dto.HierarchyCommand;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;


@Component
@RequiredArgsConstructor
public class MenuCreateCmdExe {

    private final MenuCheckService menuCheckService;
    private final MenuAssembler menuAssembler;
    private final MenuService menuService;
    private final PermissionService permissionService;
    private final MenuBizTreeService menuHierarchyService;

    public void execute(MenuCommand command) {
        baseCheck(command);

        Menu menu = save(command);

        command.setId(menu.getId());

        // 添加到层级结构中
        addToHierarchy(command);

        // 增加权限
        savePermissions(command);

        // 添加页面元素
        saveElements(command);
    }

    private void addToHierarchy(MenuCommand command) {
        // 添加树节点
        menuHierarchyService.addNode(new HierarchyCommand(command.getId(), command.getParentId(), command.getSequence()));
    }

    private Menu save(MenuCommand command) {
        Menu menu = menuAssembler.toMenuDO(command);
        menuService.save(menu);
        return menu;
    }

    private void savePermissions(MenuCommand command) {
        permissionService.addPermission(command.getId(), PermissionType.FRONT_ROUTE);
    }

    private void saveElements(MenuCommand command) {
        Long menuId = command.getId();
        List<MenuCommand.Element> elements = command.getElements();
        menuService.saveElements(menuId, elements);
    }

    private void baseCheck(MenuCommand dto) {
        menuCheckService.ensureNameNotExists(dto.getName(), dto.getId());
        menuCheckService.ensureCodeNotExists(dto.getCode(), dto.getId());
    }
}
