package com.ark.center.iam.infra.api.gateway.impl;

import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.gateway.ApiGateway;
import com.ark.center.iam.infra.api.gateway.db.ApiMapper;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ApiGatewayImpl implements ApiGateway {

    private final ApiMapper apiMapper;

    @Override
    public boolean existsByAppIdAndMethodAndUrl(Long excludeId, Long applicationId, String method, String url) {
        LambdaQueryWrapper<Api> qw = Wrappers.lambdaQuery(Api.class)
                .ne(excludeId != null, AggregateRoot::getId, excludeId)
                .eq(Api::getUri, url)
                .eq(Api::getMethod, method)
                .eq(Api::getApplicationId, applicationId)
                .eq(Api::getIsDeleted, DeletedEnums.NOT.getCode());
        return apiMapper.exists(qw);

    }

    @Override
    public void save(Api api) {
        if (api.getId() != null) {
            apiMapper.updateById(api);
        } else {
            apiMapper.insert(api);
        }
    }

    @Override
    public Api byId(Long id) {
        return apiMapper.selectById(id);
    }

    @Override
    public void delete(Long id) {
        apiMapper.deleteById(id);
    }

    @Override
    public List<Api> selectByIds(List<Long> resourceIds) {
        LambdaQueryWrapper<Api> qw = Wrappers.lambdaQuery(Api.class);
        qw.in(AggregateRoot::getId, resourceIds)
                .eq(Api::getIsDeleted, 0);
        return apiMapper.selectList(qw);
    }

    @Override
    public List<Api> byAppId(Long applicationId) {
        LambdaQueryWrapper<Api> qw = Wrappers.lambdaQuery(Api.class);
        qw.eq(Api::getApplicationId, applicationId)
                .eq(Api::getIsDeleted, 0);
        return apiMapper.selectList(qw);
    }

}
