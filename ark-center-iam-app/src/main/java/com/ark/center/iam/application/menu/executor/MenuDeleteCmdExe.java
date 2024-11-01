package com.ark.center.iam.application.menu.executor;

import com.ark.center.iam.infra.menu.service.MenuService;
import com.ark.center.iam.infra.menu.service.MenuTreeService;
import com.ark.center.iam.infra.permission.gateway.impl.PermissionService;
import com.ark.center.iam.infra.menu.Menu;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Component
@RequiredArgsConstructor
public class MenuDeleteCmdExe {

    private final MenuService menuService;
    
    private final PermissionService permissionGateway;

    private final MenuTreeService menuTreeService;

    public void execute(Long id) {

        Menu menu = menuService.getById(id);

        Long menuId = menu.getId();
        // 删除层级数据
        List<Long> removedIds = menuTreeService.removeNodeAndChildren(menuId);
        if (CollectionUtils.isEmpty(removedIds)) {
            return;
        }

        // 删除子菜单
        menuService.deleteByIds(removedIds);

        // 删除权限数据
        permissionGateway.deleteByResourceIds(removedIds);
    }

}
