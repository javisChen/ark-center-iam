package com.ark.center.iam.domain.element.service;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.domain.menu.vo.MenuElement;
import com.ark.center.iam.domain.element.gateway.ElementGateway;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.gateway.PermissionRepository;

import java.util.List;

/**
 * 角色校验服务
 */
public class ElementService {

    private final ElementGateway elementGateway;
    private final PermissionRepository permissionRepository;

    public void saveBatchElements(List<MenuElement> menuElements) {
        if (CollectionUtil.isNotEmpty(menuElements)) {
            for (MenuElement menuElement : menuElements) {
                elementGateway.insert(menuElement);
                permissionRepository.insertPermission(menuElement.getId(), PermissionType.MENU_ELEMENT);
            }
        }
    }
}
