package com.ark.center.iam.infra.resource.gateway.impl;

import com.ark.center.iam.client.user.dto.UserRouteDTO;
import com.ark.center.iam.domain.resource.gateway.ResourceRouteGateway;
import com.ark.center.iam.domain.resource.ResourceRoute;
import com.ark.center.iam.infra.resource.gateway.db.ResourceRouteMapper;
import com.ark.center.iam.infra.resource.assembler.ResourceRouteAssembler;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ResourceRouteGatewayImpl extends ServiceImpl<ResourceRouteMapper, ResourceRoute> implements ResourceRouteGateway {
    private final ResourceRouteAssembler resourceRouteAssembler;

    @Override
    public List<UserRouteDTO> selectByRouteIds(List<Long> routeIds) {
        List<ResourceRoute> resourceRoutes = lambdaQuery()
                .in(ResourceRoute::getId, routeIds)
                .orderByAsc(Lists.newArrayList(ResourceRoute::getLevel, ResourceRoute::getSequence))
                .list();
        return resourceRouteAssembler.toRouteDTO(resourceRoutes);
    }
}
