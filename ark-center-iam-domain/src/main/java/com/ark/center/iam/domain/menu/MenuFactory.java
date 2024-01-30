package com.ark.center.iam.domain.menu;

import com.ark.center.iam.domain.menu.repository.MenuRepository;
import com.ark.center.iam.domain.menu.service.MenuChecker;
import com.ark.center.iam.domain.menu.vo.MenuType;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.awt.*;

@Component
@RequiredArgsConstructor
public class MenuFactory {

    private final MenuRepository menuRepository;
    private final MenuChecker menuChecker;

    public Menu create(String name,
                       Long applicationId,
                       String code,
                       String component,
                       MenuType type,
                       Boolean hideChildren,
                       Long pid,
                       Integer sequence,
                       String path,
                       String icon, Menu parentMenu) {

        baseCheck(name, code);

        Menu menu = new Menu(name, applicationId, code, component, type, hideChildren, pid, sequence, path, icon);

        // 新增完路由记录后再更新层级信息
        updateLevelPathAfterSave(menu, parentMenu);
        // 添加到权限
        Long routeId = menu.getId();
        permissionService.addPermission(routeId, PermissionType.MENU);
        // 添加页面元素
        saveElements(cmd, routeId);
    }

    private void baseCheck(String name, String code) {
        menuChecker.ensureNameNotExists(name);
        menuChecker.ensureCodeNotExists(code);
    }

}
