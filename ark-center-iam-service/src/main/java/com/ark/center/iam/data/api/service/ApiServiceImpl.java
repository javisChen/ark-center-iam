package com.ark.center.iam.data.api.service;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ark.center.iam.common.util.Assert;
import com.ark.center.iam.dao.entity.IamApi;
import com.ark.center.iam.dao.mapper.IamApiMapper;
import com.ark.center.iam.data.api.converter.ApiBeanConverter;
import com.ark.center.iam.data.permission.service.IPermissionService;
import com.ark.center.iam.enums.BizEnums;
import com.ark.center.iam.enums.DeletedEnums;
import com.ark.center.iam.enums.PermissionTypeEnums;
import com.ark.center.iam.client.api.query.ApiQry;
import com.ark.center.iam.client.api.command.ApiUpdateCmd;
import com.ark.center.iam.client.api.dto.ApiDetailVO;
import com.ark.center.iam.client.api.dto.ApiListDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * api表 服务实现类
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Service
public class ApiServiceImpl extends ServiceImpl<IamApiMapper, IamApi> implements IApiService {

    @Autowired
    private ApiBeanConverter beanConverter;

    @Autowired
    private IPermissionService iPermissionService;

    @Override
    public long countByApplicationId(Long applicationId) {
        return this.count(new LambdaQueryWrapper<IamApi>().eq(IamApi::getApplicationId, applicationId));
    }

    @Override
    @Transactional(rollbackFor = Exception.class, timeout = 20000)
    public void saveApplication(ApiUpdateCmd dto) {
        IamApi api = getApiByApplicationIdAndMethodAndUrl(dto);
        Assert.isTrue(api != null, BizEnums.API_ALREADY_EXISTS);

        api = beanConverter.convertForUpdate(dto);
        this.save(api);

        iPermissionService.addPermission(api.getId(), PermissionTypeEnums.SER_API);
    }

    /**
     * 根据应用id+httpMethod+Url查询api记录，这三个字段保证一个api的唯一性
     */
    private IamApi getApiByApplicationIdAndMethodAndUrl(ApiUpdateCmd dto) {
        LambdaQueryWrapper<IamApi> qw = new LambdaQueryWrapper<>();
        qw.eq(IamApi::getUrl, dto.getUrl());
        qw.eq(IamApi::getMethod, dto.getMethod());
        qw.eq(IamApi::getApplicationId, dto.getApplicationId());
        qw.eq(IamApi::getIsDeleted, DeletedEnums.NOT.getCode());
        return this.getOne(qw);
    }

    @Override
    public void updateApi(ApiUpdateCmd dto) {
        IamApi api = getApiByApplicationIdAndMethodAndUrl(dto);
        Assert.isTrue(api != null && !api.getId().equals(dto.getId()), BizEnums.API_ALREADY_EXISTS);
        api = beanConverter.convertForUpdate(dto);
        this.updateById(api);
    }

    @Override
    public List<ApiListDTO> listVos(ApiQry dto) {
        LambdaQueryWrapper<IamApi> qw = new LambdaQueryWrapper<>();
        qw.eq(IamApi::getApplicationId, dto.getApplicationId());
        qw.eq(IamApi::getCategoryId, dto.getCategoryId());
        qw.eq(dto.getAuthType() != null, IamApi::getAuthType, dto.getAuthType());
        qw.eq(IamApi::getIsDeleted, DeletedEnums.NOT.getCode());
        return this.list(qw).stream().map(beanConverter::convertToApiListVO).collect(Collectors.toList());
    }

    @Override
    public void removeApi(Long id) {
        LambdaUpdateWrapper<IamApi> uw = new LambdaUpdateWrapper<>();
        uw.eq(IamApi::getId, id);
        uw.eq(IamApi::getIsDeleted, DeletedEnums.NOT.getCode());
        uw.set(IamApi::getIsDeleted, DeletedEnums.YET.getCode());
        this.update(uw);
    }

    @Override
    public List<IamApi> listAll() {
        LambdaQueryWrapper<IamApi> qw = new LambdaQueryWrapper<>();
        qw.eq(IamApi::getIsDeleted, DeletedEnums.NOT.getCode());
        return this.list(qw);
    }

    @Override
    public void removeByCategoryId(Long categoryId) {
        LambdaUpdateWrapper<IamApi> uw = new LambdaUpdateWrapper<>();
        uw.eq(IamApi::getCategoryId, categoryId);
        uw.eq(IamApi::getIsDeleted, DeletedEnums.NOT.getCode());
        uw.set(IamApi::getIsDeleted, DeletedEnums.YET.getCode());
        this.update(uw);
    }

    @Override
    public ApiDetailVO getApplicationVO(Long id) {
        IamApi iamApi = getById(id);
        return beanConverter.convertToApiDetailVO(iamApi);
    }
}
