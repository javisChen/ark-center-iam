package com.ark.center.iam.data.api.converter;


import com.ark.center.iam.dao.entity.IamApi;
import com.ark.center.iam.dao.entity.IamApiCategory;
import com.ark.center.iam.data.permission.service.IPermissionService;
import com.ark.center.iam.enums.PermissionTypeEnums;
import com.ark.center.iam.client.api.command.ApiCategoryCmd;
import com.ark.center.iam.client.api.command.ApiUpdateCmd;
import com.ark.center.iam.client.api.dto.ApiCategoryBaseDTO;
import com.ark.center.iam.client.api.dto.ApiDetailDTO;
import com.ark.center.iam.client.api.dto.ApiDetailsDTO;
import com.ark.center.iam.dao.entity.IamPermission;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@Component
public class ApiBeanConverter {

    @Autowired
    private IPermissionService iPermissionService;

    public IamApi convertForUpdate(ApiUpdateCmd dto) {
        IamApi iamApi = new IamApi();
        iamApi.setId(dto.getId());
        iamApi.setName(dto.getName());
        iamApi.setApplicationId(dto.getApplicationId());
        iamApi.setUrl(dto.getUrl());
        iamApi.setMethod(dto.getMethod());
        iamApi.setAuthType(dto.getAuthType());
        iamApi.setStatus(dto.getStatus());
        iamApi.setCategoryId(dto.getCategoryId());
        // 约定规则，如果url包含了*号就代表是包含了路径参数
        iamApi.setHasPathVariable(StringUtils.contains(dto.getUrl(), "*"));
        return iamApi;
    }

    public ApiDetailsDTO convertToApiListVO(IamApi iamApi) {
        IamPermission permission = iPermissionService.getPermission(iamApi.getId(), PermissionTypeEnums.SER_API);
        ApiDetailsDTO apiDetailsDTO = new ApiDetailsDTO();
        apiDetailsDTO.setId(iamApi.getId());
        apiDetailsDTO.setName(iamApi.getName());
        apiDetailsDTO.setUrl(iamApi.getUrl());
        apiDetailsDTO.setMethod(iamApi.getMethod());
        apiDetailsDTO.setAuthType(iamApi.getAuthType());
        apiDetailsDTO.setStatus(iamApi.getStatus());
        apiDetailsDTO.setPermissionId(permission.getId());
        apiDetailsDTO.setPermissionCode(permission.getCode());
        apiDetailsDTO.setCreateTime(iamApi.getGmtCreate());
        apiDetailsDTO.setUpdateTime(iamApi.getGmtModified());
        return apiDetailsDTO;
    }

    public ApiCategoryBaseDTO convertToApiCategoryVO(IamApiCategory category) {
        ApiCategoryBaseDTO apiCategoryBaseDTO = new ApiCategoryBaseDTO();
        apiCategoryBaseDTO.setId(category.getId());
        apiCategoryBaseDTO.setName(category.getName());
        apiCategoryBaseDTO.setApplicationId(category.getApplicationId());
        return apiCategoryBaseDTO;
    }

    public IamApiCategory convertToDO(ApiCategoryCmd dto) {
        IamApiCategory iamApiCategory = new IamApiCategory();
        iamApiCategory.setId(dto.getId());
        iamApiCategory.setName(dto.getName());
        iamApiCategory.setApplicationId(dto.getApplicationId());
        return iamApiCategory;
    }

    public ApiDetailDTO convertToApiDetailVO(IamApi iamApi) {
        ApiDetailDTO vo = new ApiDetailDTO();
        vo.setApplicationId(iamApi.getApplicationId());
        vo.setCategoryId(iamApi.getCategoryId());
        vo.setId(iamApi.getId());
        vo.setName(iamApi.getName());
        vo.setUrl(iamApi.getUrl());
        vo.setMethod(iamApi.getMethod());
        vo.setAuthType(iamApi.getAuthType());
        vo.setStatus(iamApi.getStatus());
        return vo;
    }
}
