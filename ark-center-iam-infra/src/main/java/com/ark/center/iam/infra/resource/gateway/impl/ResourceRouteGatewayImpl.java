package com.ark.center.iam.infra.resource.gateway.impl;

import com.ark.center.iam.domain.resource.route.gateway.ResourceRouteGateway;
import com.ark.center.iam.infra.resource.gateway.db.ResourceRoute;
import com.ark.center.iam.infra.resource.gateway.db.ResourceRouteMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Repository;

@Repository
public class ResourceRouteGatewayImpl extends ServiceImpl<ResourceRouteMapper, ResourceRoute> implements ResourceRouteGateway {
}
