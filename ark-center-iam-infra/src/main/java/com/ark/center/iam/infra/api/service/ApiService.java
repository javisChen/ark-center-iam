package com.ark.center.iam.infra.api.service;

import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.client.api.query.ApiQuery;
import com.ark.center.iam.infra.api.Api;
import com.ark.center.iam.infra.api.gateway.db.ApiMapper;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.ark.component.web.common.DeletedEnums;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ApiService extends ServiceImpl<ApiMapper, Api> {

    public List<ApiDetailsDTO> selectList(ApiQuery apiQuery) {
        return baseMapper.selectApiList(apiQuery);
    }

    public Api selectApiByApplicationIdAndMethodAndUrl(Long applicationId, String method, String url) {
        return lambdaQuery()
                .eq(Api::getUri, url)
                .eq(Api::getMethod, method)
                .eq(Api::getApplicationId, applicationId)
                .eq(Api::getIsDeleted, DeletedEnums.NOT.getCode())
                .one();
    }

    public void updateByApiId(Api api) {
        updateById(api);
    }

    public void delete(Long id) {
        lambdaUpdate()
                .eq(Api::getId, id)
                .eq(Api::getIsDeleted, DeletedEnums.NOT.getCode())
                .set(Api::getIsDeleted, DeletedEnums.YET.getCode())
                .update();
    }

    public List<Api> selectByIds(List<Long> resourceIds) {
        return lambdaQuery()
                .in(BaseEntity::getId, resourceIds)
                .eq(Api::getIsDeleted, 0)
                .list();
    }

    public List<Api> selectByApplicationId(Long applicationId) {
        return lambdaQuery().eq(Api::getApplicationId, applicationId).list();
    }

}
