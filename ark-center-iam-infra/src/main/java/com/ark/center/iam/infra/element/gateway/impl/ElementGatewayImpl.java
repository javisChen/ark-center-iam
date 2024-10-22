package com.ark.center.iam.infra.element.gateway.impl;

import com.ark.center.iam.infra.element.Element;
import com.ark.center.iam.infra.element.assembler.ElementAssembler;
import com.ark.center.iam.infra.menu.gateway.ElementGateway;
import com.ark.center.iam.infra.menu.db.ElementMapper;
import com.ark.center.iam.infra.permission.gateway.PermissionGateway;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ElementGatewayImpl extends ServiceImpl<ElementMapper, Element> implements ElementGateway {

    private final ElementAssembler elementAssembler;
    private final PermissionGateway permissionGateway;

    @Override
    public void insert(Element element) {
        save(element);
    }

    @Override
    public void deleteByMenuId(Long menuId) {
        lambdaUpdate()
                .eq(Element::getMenuId, menuId)
                .remove();
    }

    @Override
    public List<Element> selectElementsByRouteId(Long routeId) {
        return lambdaQuery()
                .eq(Element::getMenuId, routeId)
                .eq(Element::getIsDeleted, DeletedEnums.NOT.getCode())
                .list();
    }

}
