package com.kt.upms.module.permission.service;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.kt.upms.enums.PermissionStatusEnums;
import com.kt.upms.enums.PermissionTypeEnums;
import com.kt.upms.module.application.persistence.UpmsApplication;
import com.kt.upms.module.application.service.IApplicationService;
import com.kt.upms.module.permission.bo.ApiPermissionBO;
import com.kt.upms.module.permission.converter.PermissionBeanConverter;
import com.kt.upms.module.permission.persistence.UpmsPermission;
import com.kt.upms.module.permission.persistence.UpmsPermissionRoleRel;
import com.kt.upms.module.permission.persistence.dao.UpmsPermissionMapper;
import com.kt.upms.module.permission.persistence.dao.UpmsPermissionRoleRelMapper;
import com.kt.upms.module.permission.vo.PermissionVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * <p>
 * 权限表 服务实现类
 * </p>
 *
 * @author
 * @since 2020-11-09
 */
@Service
public class PermissionServiceImpl extends ServiceImpl<UpmsPermissionMapper, UpmsPermission>
        implements IPermissionService {

    @Autowired
    private PermissionBeanConverter beanConverter;

    @Autowired
    private IApplicationService iApplicationService;

    @Autowired
    private UpmsPermissionRoleRelMapper permissionRoleRelMapper;

    @Override
    public void addPermission(Long resourceId, PermissionTypeEnums permissionTypeEnums) {
        UpmsPermission permission = new UpmsPermission();
        permission.setType(permissionTypeEnums.getType());
        permission.setResourceId(resourceId);
        permission.setStatus(PermissionStatusEnums.ENABLED.getValue());
        permission.setCode(generatePermissionCode(permissionTypeEnums.getTag(), resourceId));
        this.save(permission);
    }

    @Override
    public void batchSaveRolePermissionRel(Long roleId, List<Long> permissionIds) {
        if (CollectionUtil.isNotEmpty(permissionIds)) {
            permissionRoleRelMapper.batchInsert(roleId, permissionIds);
        }
    }

    @Override
    public void removeRolePermission(Long roleId, List<Long> permissionIds) {
        if (CollectionUtil.isNotEmpty(permissionIds)) {
            LambdaQueryWrapper<UpmsPermissionRoleRel> qw = new LambdaQueryWrapper<UpmsPermissionRoleRel>()
                    .eq(UpmsPermissionRoleRel::getRoleId, roleId)
                    .in(UpmsPermissionRoleRel::getPermissionId, permissionIds);
            permissionRoleRelMapper.delete(qw);
        }
    }

    /**
     * 生成权限编码
     * 规则：类型首字母+资源id（十位，不足左补0） EXAMPLE：P0000000001
     */
    private String generatePermissionCode(String tag, long id) {
        return tag + StringUtils.leftPad(String.valueOf(id), 9, "0");
    }

    @Override
    public List<UpmsPermission> getPermissionByRoleIds(Set<Long> roleIds, PermissionTypeEnums permissionTypeEnums) {
        if (CollectionUtil.isEmpty(roleIds)) {
            return CollectionUtil.newArrayList();
        }
        return this.baseMapper.selectByRoleIdsAndType(roleIds, permissionTypeEnums.getType());
    }

    @Override
    public List<UpmsPermission> getAllPermissionsByType(PermissionTypeEnums type) {
        LambdaQueryWrapper<UpmsPermission> qw = new LambdaQueryWrapper<>();
        qw.eq(UpmsPermission::getType, type);
        qw.eq(UpmsPermission::getStatus, PermissionStatusEnums.ENABLED.getValue());
        return this.list(qw);
    }

    private UpmsPermission getPermissionById(Long permissionId) {
        return this.getOne(new LambdaQueryWrapper<UpmsPermission>().eq(UpmsPermission::getId, permissionId));
    }

    @Override
    public UpmsPermission getPermissionByResourceIdAndType(Long resourceId, PermissionTypeEnums permissionTypeEnums) {
        final LambdaQueryWrapper<UpmsPermission> eq = new LambdaQueryWrapper<UpmsPermission>()
                .eq(UpmsPermission::getResourceId, resourceId)
                .eq(UpmsPermission::getType, permissionTypeEnums.getType());
        return Optional.ofNullable(this.getOne(eq)).orElseGet(UpmsPermission::new);
    }

    @Override
    public List<PermissionVO> getRolePermissionVos(Long applicationId, Long roleId, String permissionType) {
        List<UpmsPermission> permissions = this.baseMapper.selectByRoleIdAndType(applicationId, roleId, permissionType);
        return permissions.stream().map(beanConverter::convertToVO).collect(Collectors.toList());
    }

    @Override
    public UpmsPermission getPermission(Long resourceId, PermissionTypeEnums permissionTypeEnums) {
        LambdaQueryWrapper<UpmsPermission> qw = new LambdaQueryWrapper<>();
        qw.select(UpmsPermission::getId, UpmsPermission::getCode);
        qw.eq(UpmsPermission::getResourceId, resourceId);
        qw.eq(UpmsPermission::getType, permissionTypeEnums.getType());
        return Optional.ofNullable(this.getOne(qw)).orElseGet(UpmsPermission::new);
    }

    @Override
    public List<ApiPermissionBO> getApiPermissionByIds(List<Long> permissionIds) {
        return this.baseMapper.selectApiPermissionByIds(permissionIds);
    }

    @Override
    public List<ApiPermissionBO> getApiPermissionByRoleIdsAndApplicationCode(String applicationCode, Set<Long> roleIdSet) {
        if (CollectionUtil.isEmpty(roleIdSet)) {
            return CollectionUtil.newArrayList();
        }
        UpmsApplication application = iApplicationService.getApplicationByCode(applicationCode);
        if (application == null) {
            return CollectionUtil.newArrayList();
        }
        return this.baseMapper.selectApiPermissionsByRoleIdsAndApplicationId(application.getId(), roleIdSet);
    }


    @Override
    public void removeByResourceIds(List<Long> ids) {
        LambdaQueryWrapper<UpmsPermission> qw = new LambdaQueryWrapper<>();
        qw.in(UpmsPermission::getResourceId, ids);
        this.remove(qw);
    }

}
