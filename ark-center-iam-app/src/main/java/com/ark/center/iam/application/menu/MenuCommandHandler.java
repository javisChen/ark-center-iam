package com.ark.center.iam.application.menu;

import com.ark.center.iam.application.menu.executor.*;
import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.client.menu.command.MenuStatusCommand;
import com.ark.center.iam.client.menu.command.RouteModifyParentCmd;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.service.MenuService;
import com.ark.center.iam.infra.menu.service.MenuCheckService;
import com.ark.center.iam.infra.menu.assembler.MenuAssembler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class MenuCommandHandler {

    private final MenuCreateCmdExe menuCreateCmdExe;
    private final MenuUpdateCmdExe menuUpdateCmdExe;
    private final MenuDeleteCmdExe menuDeleteCmdExe;
    private final MenuCheckService menuCheckService;
    private final MenuService menuService;
    private final MenuAssembler menuAssembler;

    @Transactional(rollbackFor = Throwable.class)
    public void save(MenuCommand command) {
        if (command.getId() == null) {
            menuCreateCmdExe.execute(command);
        } else {
            menuUpdateCmdExe.execute(command);
        }
    }

    @Transactional(rollbackFor = Throwable.class)
    public void modifyParent(RouteModifyParentCmd parentCmd) {

        menuCheckService.ensureRouteNotExists(parentCmd.getId());

        menuCheckService.ensureRouteNotExists(parentCmd.getParentId(), "父级路由不存在");

        Menu menu = menuAssembler.toMenuDO(parentCmd);

        menuService.updateById(menu);

    }

    @Transactional(rollbackFor = Throwable.class)
    public void updateStatus(MenuStatusCommand command) {
        menuService.updateChildrenStatus(command.getId(), command.getStatus());
    }

    @Transactional(rollbackFor = Throwable.class)
    public void deleteById(Long id) {
        menuDeleteCmdExe.execute(id);
    }

}
