package com.ark.center.iam.infra.resource.gateway.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.extra.cglib.CglibUtil;
import com.ark.center.iam.client.route.command.RouteCmd;
import com.ark.center.iam.client.route.dto.PageElementUpdateDTO;
import com.ark.center.iam.domain.element.gateway.ElementGateway;
import com.ark.center.iam.domain.element.Element;
import com.ark.center.iam.infra.resource.gateway.db.ElementMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ElementGatewayImpl extends ServiceImpl<ElementMapper, Element> implements ElementGateway {

    @Override
    public void insert(Element element) {
        save(element);
    }

}
