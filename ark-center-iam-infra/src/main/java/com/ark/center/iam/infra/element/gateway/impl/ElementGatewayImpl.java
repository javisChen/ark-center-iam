package com.ark.center.iam.infra.element.gateway.impl;

import com.ark.center.iam.domain.menu.vo.MenuElement;
import com.ark.center.iam.domain.element.gateway.ElementGateway;
import com.ark.center.iam.infra.menu.repository.db.MenuElementMapper;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ElementGatewayImpl extends ServiceImpl<MenuElementMapper, MenuElement> implements ElementGateway {

    @Override
    public void insert(MenuElement menuElement) {
        save(menuElement);
    }

    @Override
    public void deleteByRouteId(Long routeId) {
        LambdaUpdateWrapper<MenuElement> wrapper = new LambdaUpdateWrapper<MenuElement>()
                .eq(MenuElement::getMenuId, routeId)
                .set(MenuElement::getIsDeleted, DeletedEnums.YET.getCode());
        update(wrapper);
    }

    @Override
    public List<MenuElement> selectElementsByRouteId(Long routeId) {
        return lambdaQuery()
                .eq(MenuElement::getMenuId, routeId)
                .eq(MenuElement::getIsDeleted, DeletedEnums.NOT.getCode())
                .list();
    }

}
