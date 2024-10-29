package com.ark.center.iam.application.menu.executor;

import com.ark.center.iam.infra.menu.gateway.impl.MenuTreeService;
import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.infra.menu.assembler.MenuAssembler;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.gateway.impl.MenuService;
import com.ark.center.iam.infra.menu.service.MenuCheckService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class MenuUpdateCmdExe {

    private final MenuCheckService menuCheckService;
    private final MenuTreeService menuTreeService;
    private final MenuService menuService;
    private final MenuAssembler menuAssembler;

    public void execute(MenuCommand command) {
        Long menuId = command.getId();

        // 基础校验
        baseCheck(command);

        // 更新路由基础信息
        updateBase(command);

        // 尝试更新子菜单状态
        tryToUpdateChildrenStatus(menuId, command.getStatus());

        // 尝试更新子节点层级
        tryToChangeChildren(menuId, command.getParentId());

        // 处理页面元素
        saveElements(menuId, command);

    }

    private void saveElements(Long menuId, MenuCommand command) {
        menuService.saveElements(menuId, command.getElements());
    }

    private void updateBase(MenuCommand command) {
        Menu menu = menuAssembler.toMenuDO(command);
        menuService.updateById(menu);
    }

    /**
     * 尝试更新子路由状态
     */
    public void tryToUpdateChildrenStatus(Long menuId, Integer status) {
        menuService.updateChildrenStatus(menuId, status);
    }

    /**
     * 根据pid是否有变动确定是否需要变更移动层级
     *
     * @param menuId 原路由id
     * @param parentId   所属路由id
     */
    private void tryToChangeChildren(Long menuId, Long parentId) {
        menuTreeService.changeLevel(menuId, parentId);
    }


    private void baseCheck(MenuCommand dto) {
        menuCheckService.ensureNameNotExists(dto.getName(), dto.getId());
        menuCheckService.ensureCodeNotExists(dto.getCode(), dto.getId());
    }

}
