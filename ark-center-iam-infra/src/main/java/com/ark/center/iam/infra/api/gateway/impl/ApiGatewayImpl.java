package com.ark.center.iam.infra.api.gateway.impl;

import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.client.api.query.ApiQry;
import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.gateway.ApiGateway;
import com.ark.center.iam.infra.api.assembler.ApiAssembler;
import com.ark.center.iam.infra.api.gateway.db.ApiMapper;
import com.ark.component.cache.CacheService;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ApiGatewayImpl extends ServiceImpl<ApiMapper, Api> implements ApiGateway {

    private final ApiAssembler apiAssembler;

    private final CacheService cacheService;

    @Override
    public List<ApiDetailsDTO> selectList(ApiQry apiQry) {
        return baseMapper.selectApiList(apiQry);
    }

    @Override
    public Api selectApiByApplicationIdAndMethodAndUrl(Long applicationId, String method, String url) {
        return lambdaQuery()
                .eq(Api::getUri, url)
                .eq(Api::getMethod, method)
                .eq(Api::getApplicationId, applicationId)
                .eq(Api::getIsDeleted, DeletedEnums.NOT.getCode())
                .one();
    }

    @Override
    public void insert(Api api) {
        save(api);
    }

    @Override
    public Api selectById(Long id) {
        return getById(id);
    }

    @Override
    public void updateApiId(Api api) {
        updateById(api);
    }

    @Override
    public void delete(Long id) {
        lambdaUpdate()
                .eq(Api::getId, id)
                .eq(Api::getIsDeleted, DeletedEnums.NOT.getCode())
                .set(Api::getIsDeleted, DeletedEnums.YET.getCode())
                .update();
    }

    @Override
    public List<Api> selectByIds(List<Long> resourceIds) {
        return lambdaQuery()
                .in(BaseEntity::getId, resourceIds)
                .eq(Api::getIsDeleted, 0)
                .list();
    }

    @Override
    public List<Api> selectByApplicationId(Long applicationId) {
        return lambdaQuery().eq(Api::getApplicationId, applicationId).list();
    }

    @Override
    public boolean insertOrUpdate(Api api) {
        return saveOrUpdate(api);
    }

}
