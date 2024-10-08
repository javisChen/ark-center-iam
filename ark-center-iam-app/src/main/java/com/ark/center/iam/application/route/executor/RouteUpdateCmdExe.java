package com.ark.center.iam.application.route.executor;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.client.menu.command.MenuCommand;
import com.ark.center.iam.infra.element.Element;
import com.ark.center.iam.infra.element.gateway.ElementGateway;
import com.ark.center.iam.infra.element.service.ElementService;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.common.RouteConst;
import com.ark.center.iam.infra.menu.gateway.MenuGateway;
import com.ark.center.iam.infra.menu.service.MenuCheckService;
import com.ark.center.iam.infra.menu.service.RouteService;
import com.ark.center.iam.infra.element.assembler.ElementAssembler;
import com.ark.center.iam.infra.route.assembler.RouteAssembler;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class RouteUpdateCmdExe {

    private final MenuCheckService menuCheckService;
    private final RouteService routeService;
    private final RouteAssembler routeAssembler;
    private final MenuGateway menuGateway;
    private final ElementGateway elementGateway;
    private final ElementService elementService;
    private final ElementAssembler elementAssembler;

    public void execute(MenuCommand dto) {
        Long routeId = dto.getId();

        // 基础校验
        baseCheck(dto);

        // 更新路由基础信息
        updateBase(dto);

        // 更新子路由状态
        tryUpdateChildrenStatus(routeId, dto.getStatus());

        // 尝试移动层级
        tryMoveLevel(routeId, dto.getPid());

        // 清除路由下的页面元素
        clearRouteElements(routeId);

        // 保存页面元素
        saveElements(dto, routeId);

    }

    private void updateBase(MenuCommand dto) {
        Menu menu = routeAssembler.toMenuDO(dto);
        menuGateway.updateByRouteId(menu);
    }

    private void clearRouteElements(Long routeId) {
        elementGateway.deleteByRouteId(routeId);
    }

    private void saveElements(MenuCommand cmd, Long routeId) {
        List<MenuCommand.Element> elements = cmd.getElements();
        if (CollectionUtils.isEmpty(elements)) {
            return;
        }
        elementService.saveBatchElements(elements.stream().map(item -> {
            Element elementDO = elementAssembler.toElementDO(item, routeId);
            elementDO.setRouteId(routeId);
            return elementDO;
        }).toList());
    }

    /**
     * 尝试更新子路由状态
     */
    public void tryUpdateChildrenStatus(Long routeId, Integer status) {
        routeService.updateRouteStatus(routeId, status);
    }

    /**
     * 根据pid是否有变动确定是否需要变更移动层级
     *
     * @param fromRouteId 原路由id
     * @param toRouteId   所属路由id
     */
    private void tryMoveLevel(Long fromRouteId, Long toRouteId) {
        Menu menu = menuGateway.selectBaseByRouteId(fromRouteId);
//        Long oldPid = menu.getPid();
        Long oldPid = null;
        // 如果pid不一致的话才做更新
        if (!oldPid.equals(toRouteId)) {

            Menu parentMenu = toRouteId.equals(RouteConst.DEFAULT_PID) ? defaultParentRoute() : menuGateway.selectBaseByRouteId(toRouteId);
            updateRouteLevel(menu, parentMenu);

//            List<Menu> children = getChildrenRouteByLevelPath(menu.getLevelPath());
//            updateRouteChildrenLevel(parentMenu, children);
        }
    }

    private Menu defaultParentRoute() {
        Menu menu = new Menu();
        menu.setId(0L);
//        menu.setPid(0L);
//        menu.setLevelPath("");
//        menu.setLevel(0);
        return menu;
    }

    private void updateRouteChildrenLevel(Menu parentMenu, List<Menu> children) {
        if (CollectionUtil.isNotEmpty(children)) {
            List<Menu> collect = children.stream().map(item -> {
                Menu menu = new Menu();
                menu.setId(item.getId());
//                menu.setLevel(parentMenu.getLevel() + 1);
//                menu.setLevelPath(createChildLevelPath(item.getId(), item.getLevelPath(), parentMenu.getLevelPath()));
                return menu;
            }).collect(Collectors.toList());
            menuGateway.updateBatchByRouteId(collect);
        }
    }

    private String createChildLevelPath(Long oldRoutePid, String oldRouteLevelPath,
                                        String newParentRouteLevelPath) {
        // 如果当前路由是"64.65.66." 父路由id是"65"，那么该值就是"64."，把该值替换成当前修改的父级路由的level_path
        String partOfOldParent = StringUtils.substringBefore(oldRouteLevelPath, String.valueOf(oldRoutePid));
        return StringUtils.replace(oldRouteLevelPath, partOfOldParent, newParentRouteLevelPath);
    }

    private List<Menu> getChildrenRouteByLevelPath(String levelPath) {
        return menuGateway.selectByLevelPath(levelPath);
    }

    /**
     * 更新路由的层级信息
     */
    private void updateRouteLevel(Menu menu, Menu parentMenu) {
//        Menu newMenu = new Menu();
//        newMenu.setId(menu.getId());
//        newMenu.setPid(parentMenu.getId());
//        String routeLevelPath = menu.getLevelPath();
//        String parentRouteLevelPath = parentMenu.getLevelPath();
//        String levelPath = menu.isFirstLevel() ? (parentRouteLevelPath + routeLevelPath)
//                : createNewLevelPath(menu.getId(), routeLevelPath, parentRouteLevelPath);
//        newMenu.setLevelPath(levelPath);
//        newMenu.setLevel(parentMenu.getLevel() + 1);
//        menuGateway.updateByRouteId(newMenu);
    }

    private String createNewLevelPath(Long oldRouteId, String oldRouteLevelPath, String parentRouteLevelPath) {
        String partOfOldParent = StringUtils.substringBefore(oldRouteLevelPath, String.valueOf(oldRouteId));
        return StringUtils.replace(oldRouteLevelPath, partOfOldParent, parentRouteLevelPath);
    }


    private void baseCheck(MenuCommand dto) {
        menuCheckService.ensureNameNotExists(dto.getName(), dto.getId());
        menuCheckService.ensureCodeNotExists(dto.getCode(), dto.getId());
    }

}
