package com.ark.center.iam.application.menu.executor;

import com.ark.center.iam.infra.menu.gateway.impl.MenuTreeService;
import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.assembler.MenuAssembler;
import com.ark.center.iam.infra.menu.gateway.MenuGateway;
import com.ark.center.iam.infra.menu.service.MenuCheckService;
import com.ark.center.iam.infra.permission.enums.PermissionType;
import com.ark.center.iam.infra.permission.gateway.impl.PermissionService;

import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;


@Component
@RequiredArgsConstructor
public class MenuCreateCmdExe {

    private final MenuCheckService menuCheckService;
    private final MenuAssembler menuAssembler;
    private final MenuGateway menuGateway;
    private final PermissionService permissionService;
    private final MenuTreeService menuTreeService;

    public void execute(MenuCommand command) {
        baseCheck(command);

        Menu menu = save(command);

        command.setId(menu.getId());

        // 添加到树节点
        addTreeNode(command);

        // 增加权限
        savePermissions(command);

        // 添加页面元素
        saveElements(command);
    }

    private void addTreeNode(MenuCommand command) {
        // 添加树节点
        menuTreeService.addNode(command);
    }

    private Menu save(MenuCommand command) {
        Menu menu = menuAssembler.toMenuDO(command);
        menuGateway.saveMenu(menu);
        return menu;
    }

    private void savePermissions(MenuCommand command) {
        permissionService.addPermission(command.getId(), PermissionType.FRONT_ROUTE);
    }

    private void saveElements(MenuCommand command) {
        Long menuId = command.getId();
        List<MenuCommand.Element> elements = command.getElements();
        menuGateway.saveElements(menuId, elements);
    }

    private void baseCheck(MenuCommand dto) {
        menuCheckService.ensureNameNotExists(dto.getName(), dto.getId());
        menuCheckService.ensureCodeNotExists(dto.getCode(), dto.getId());
    }
}
