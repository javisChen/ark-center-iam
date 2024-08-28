package com.ark.center.iam.infra.element.gateway.impl;

import com.ark.center.iam.infra.element.Element;
import com.ark.center.iam.infra.element.gateway.ElementGateway;
import com.ark.center.iam.infra.element.gateway.db.ElementMapper;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ElementGatewayImpl extends ServiceImpl<ElementMapper, Element> implements ElementGateway {

    @Override
    public void insert(Element element) {
        save(element);
    }

    @Override
    public void deleteByRouteId(Long routeId) {
        LambdaUpdateWrapper<Element> wrapper = new LambdaUpdateWrapper<Element>()
                .eq(Element::getRouteId, routeId)
                .set(Element::getIsDeleted, DeletedEnums.YET.getCode());
        update(wrapper);
    }

    @Override
    public List<Element> selectElementsByRouteId(Long routeId) {
        return lambdaQuery()
                .eq(Element::getRouteId, routeId)
                .eq(Element::getIsDeleted, DeletedEnums.NOT.getCode())
                .list();
    }

}
