package com.ark.center.iam.infra.api.converter;

import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.vo.ApiAuthType;
import com.ark.center.iam.infra.api.repository.db.ApiDO;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface ApiDomainConverter {

    @Mapping(target = "isDeleted", ignore = true)
    default ApiDO convert(Api api) {
        ApiDO apiDO = new ApiDO();
        apiDO.setName(api.getName());
        apiDO.setApplicationId(api.getApplicationId());
        apiDO.setCategoryId(api.getCategoryId());
        apiDO.setUri(api.getUri());
        apiDO.setMethod(api.getMethod());
        apiDO.setAuthType(api.getAuthType().getValue());
        apiDO.setHasPathVariable(api.getHasPathVariable());
        apiDO.setStatus(api.getStatus().getValue());
        apiDO.setId(api.getId());
        return apiDO;
    }

    default Api convert(ApiDO apiDO) {
        return Api.builder()
        		.name(apiDO.getName())
        		.applicationId(apiDO.getApplicationId())
        		.categoryId(apiDO.getCategoryId())
        		.uri(apiDO.getUri())
        		.method(apiDO.getMethod())
        		.authType(ApiAuthType.from(apiDO.getAuthType()))
        		.hasPathVariable(apiDO.getHasPathVariable())
        		.status(EnableDisableStatus.from(apiDO.getStatus()))
        		.build();
    }

    List<Api> convert(List<ApiDO> doList);
}
