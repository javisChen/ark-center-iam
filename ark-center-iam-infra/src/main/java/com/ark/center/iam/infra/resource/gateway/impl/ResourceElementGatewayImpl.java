package com.ark.center.iam.infra.resource.gateway.impl;

import com.ark.center.iam.domain.resource.gateway.ResourceElementGateway;
import com.ark.center.iam.domain.resource.ResourceElement;
import com.ark.center.iam.infra.resource.gateway.db.ResourceElementMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Repository;

@Repository
public class ResourceElementGatewayImpl extends ServiceImpl<ResourceElementMapper, ResourceElement> implements ResourceElementGateway {
}
