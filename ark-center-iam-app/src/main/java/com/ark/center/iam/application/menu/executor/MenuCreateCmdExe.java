package com.ark.center.iam.application.menu.executor;

import com.ark.center.iam.application.menu.MenuTreeService;
import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.infra.element.Element;
import com.ark.center.iam.infra.element.service.ElementService;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.assembler.MenuAssembler;
import com.ark.center.iam.infra.menu.gateway.MenuGateway;
import com.ark.center.iam.infra.menu.service.MenuCheckService;
import com.ark.center.iam.infra.permission.enums.PermissionType;
import com.ark.center.iam.infra.permission.service.PermissionService;
import com.ark.center.iam.infra.element.assembler.ElementAssembler;
import com.ark.center.iam.infra.menu.gateway.impl.MenuService;
import com.ark.component.tree.TreeService;

import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;


@Component
@RequiredArgsConstructor
public class MenuCreateCmdExe {

    private final MenuCheckService menuCheckService;

    private final MenuAssembler menuAssembler;

    private final MenuGateway menuGateway;

    private final MenuService menuService;

    private final ElementAssembler elementAssembler;

    private final ElementService elementService;

    private final PermissionService permissionService;

    private final TreeService treeService;

    private final MenuTreeService menuTreeService;

    public void execute(MenuCommand command) {
        baseCheck(command);

        Menu menu = menuAssembler.toMenuDO(command);
        menuService.save(menu);

        command.setId(menu.getId());

        // 添加树节点
        menuTreeService.addNode(command);

        // 添加到权限
        Long menuId = menu.getId();

        permissionService.addPermission(menuId, PermissionType.FRONT_ROUTE);

        // 添加页面元素
        saveElements(command);
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
