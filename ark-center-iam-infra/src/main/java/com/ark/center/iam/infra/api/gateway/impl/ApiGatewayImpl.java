package com.ark.center.iam.infra.api.gateway.impl;

import com.ark.center.iam.domain.api.gateway.ApiGateway;
import com.ark.center.iam.infra.api.gateway.db.Api;
import com.ark.center.iam.infra.api.gateway.db.ApiMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Repository;

@Repository
public class ApiGatewayImpl extends ServiceImpl<ApiMapper, Api> implements ApiGateway {

}
