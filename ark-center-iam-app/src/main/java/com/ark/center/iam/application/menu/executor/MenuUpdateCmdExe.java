package com.ark.center.iam.application.menu.executor;

import com.ark.center.iam.application.menu.MenuTreeService;
import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.infra.menu.gateway.ElementGateway;
import com.ark.center.iam.infra.element.service.ElementService;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.gateway.impl.MenuService;
import com.ark.center.iam.infra.menu.service.MenuCheckService;
import com.ark.center.iam.infra.element.assembler.ElementAssembler;
import com.ark.center.iam.infra.menu.assembler.RouteAssembler;
import com.ark.center.iam.infra.menu.db.MenuDAO;
import com.ark.component.orm.mybatis.base.BaseEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class MenuUpdateCmdExe {

    private final MenuCheckService menuCheckService;
    private final MenuTreeService menuTreeService;
    private final MenuService menuService;
    private final RouteAssembler routeAssembler;
    private final MenuDAO menuDAO;

    public void execute(MenuCommand command) {
        Long menuId = command.getId();

        // 基础校验
        baseCheck(command);

        // 更新路由基础信息
        updateBase(command);

        // 尝试更新子菜单状态
        tryToUpdateChildrenStatus(menuId, command.getStatus());

        // 尝试更新子节点层级
        tryToChangeChildren(menuId, command.getPid());

        // 处理页面元素
        processElements(command);

    }

    private void processElements(MenuCommand command) {
        Long menuId = command.getId();
        menuService.saveElements(menuId, command.getElements());
    }

    private void updateBase(MenuCommand command) {
        Menu menu = routeAssembler.toMenuDO(command);
        menuDAO.updateById(menu);
    }

    /**
     * 尝试更新子路由状态
     */
    public void tryToUpdateChildrenStatus(Long menuId, Integer status) {
        List<Long> treeNodes = menuTreeService.queryChildNodes(menuId);
        if (org.apache.commons.collections4.CollectionUtils.isNotEmpty(treeNodes)) {
            menuDAO.lambdaUpdate()
                    .set(Menu::getStatus, status)
                    .in(BaseEntity::getId, treeNodes);
        }
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
