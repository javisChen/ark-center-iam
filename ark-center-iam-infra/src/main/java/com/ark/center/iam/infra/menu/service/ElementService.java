package com.ark.center.iam.infra.menu.service;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.infra.menu.Element;
import com.ark.center.iam.infra.menu.db.ElementMapper;
import com.ark.center.iam.infra.permission.enums.PermissionType;
import com.ark.center.iam.infra.permission.gateway.impl.PermissionService;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 角色校验服务
 */
@Service
@RequiredArgsConstructor
public class ElementService extends ServiceImpl<ElementMapper, Element> {

    private final PermissionService permissionGateway;

    public void saveBatchElements(List<Element> elements) {
        if (CollectionUtil.isNotEmpty(elements)) {
            for (Element element : elements) {
                save(element);
                permissionGateway.insertPermission(element.getId(), PermissionType.PAGE_ELEMENT);
            }
        }
    }

    public void deleteByMenuId(Long menuId) {
        lambdaUpdate()
                .eq(Element::getMenuId, menuId)
                .remove();
    }

    public void insert(Element element) {
        save(element);
    }

    public List<Element> byMenuId(Long menuId) {
        return lambdaQuery()
                .eq(Element::getMenuId, menuId)
                .eq(Element::getIsDeleted, DeletedEnums.NOT.getCode())
                .list();
    }

}
