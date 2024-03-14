package com.ark.center.iam.infra.api.converter;

import com.ark.center.iam.domain.api.Api;
import com.ark.center.iam.domain.api.vo.ApiAuthType;
import com.ark.center.iam.infra.api.repository.db.ApiDO;
import com.ark.center.iam.model.api.dto.ApiDetailDTO;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;


@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface ApiAppConverter {

    default ApiDO fromDomain(Api api) {
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

    List<Api> fromDomain(List<ApiDO> doList);

    List<Api> toDomain(List<ApiDO> apiDOS);

    default Api toDomain(ApiDO apiDO) {
        Api api = new Api();
        api.setName(apiDO.getName());
        api.setApplicationId(apiDO.getApplicationId());
        api.setCategoryId(apiDO.getCategoryId());
        api.setUri(apiDO.getUri());
        api.setMethod(apiDO.getMethod());
        api.setAuthType(ApiAuthType.from(apiDO.getAuthType()));
        api.setHasPathVariable(apiDO.getHasPathVariable());
        api.setStatus(EnableDisableStatus.from(apiDO.getStatus()));
        api.setId(apiDO.getId());
        api.setCreateTime(apiDO.getCreateTime());
        api.setUpdateTime(apiDO.getUpdateTime());
        api.setCreator(apiDO.getCreator());
        api.setModifier(apiDO.getModifier());
        return api;
    }

    default ApiDetailDTO toDetailDTO(ApiDO apiDO) {
        ApiDetailDTO apiDetailDTO = new ApiDetailDTO();
        apiDetailDTO.setApplicationId(apiDO.getApplicationId());
        apiDetailDTO.setCategoryId(apiDO.getCategoryId());
        apiDetailDTO.setId(apiDO.getId());
        apiDetailDTO.setName(apiDO.getName());
        apiDetailDTO.setUri(apiDO.getUri());
        apiDetailDTO.setMethod(apiDO.getMethod());
        apiDetailDTO.setAuthType(apiDO.getAuthType());
        apiDetailDTO.setStatus(apiDO.getStatus());
        apiDetailDTO.setHasPathVariable(apiDO.getHasPathVariable());
        return apiDetailDTO;
    }
}
