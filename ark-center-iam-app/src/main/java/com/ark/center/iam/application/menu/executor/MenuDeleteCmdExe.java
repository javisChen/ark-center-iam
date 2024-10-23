package com.ark.center.iam.application.menu.executor;

import com.ark.center.iam.application.menu.MenuTreeService;
import com.ark.center.iam.infra.permission.gateway.PermissionGateway;
import com.ark.center.iam.infra.menu.Menu;
import com.ark.center.iam.infra.menu.gateway.MenuGateway;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Component
@RequiredArgsConstructor
public class MenuDeleteCmdExe {

    private final MenuGateway menuGateway;
    
    private final PermissionGateway permissionGateway;

    private final MenuTreeService menuTreeService;

    public void execute(Long id) {

        Menu menu = menuGateway.byId(id);

        Long menuId = menu.getId();
        List<Long> childIds = menuTreeService.queryChildNodeIds(menuId);
        if (CollectionUtils.isEmpty(childIds)) {
            return;
        }

        // 删除层级数据
        menuTreeService.removeNode(menuId);

        // 删除子菜单
        menuGateway.deleteByIds(childIds);

        // 删除权限数据
        permissionGateway.deleteByResourceIds(childIds);
    }

}
