package com.ark.center.iam.domain.element.service;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.domain.menu.vo.MenuElement;
import com.ark.center.iam.domain.element.gateway.ElementGateway;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.gateway.PermissionGateway;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 角色校验服务
 */
@Service
@RequiredArgsConstructor
public class ElementService {

    private final ElementGateway elementGateway;
    private final PermissionGateway permissionGateway;

    public void saveBatchElements(List<MenuElement> menuElements) {
        if (CollectionUtil.isNotEmpty(menuElements)) {
            for (MenuElement menuElement : menuElements) {
                elementGateway.insert(menuElement);
                permissionGateway.insertPermission(menuElement.getId(), PermissionType.PAGE_ELEMENT);
            }
        }
    }
}
