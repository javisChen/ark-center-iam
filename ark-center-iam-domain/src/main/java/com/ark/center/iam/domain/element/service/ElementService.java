package com.ark.center.iam.domain.element.service;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.domain.element.Element;
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

    public void saveBatchElements(List<Element> elements) {
        if (CollectionUtil.isNotEmpty(elements)) {
            for (Element element : elements) {
                elementGateway.insert(element);
                permissionGateway.insertPermission(element.getId(), PermissionType.PAGE_ELEMENT);
            }
        }
    }
}
