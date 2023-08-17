package com.ark.center.iam.infra.permission.gateway.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.client.permission.vo.PermissionDTO;
import com.ark.center.iam.domain.api.vo.ApiPermissionVO;
import com.ark.center.iam.domain.permission.Permission;
import com.ark.center.iam.domain.permission.enums.PermissionStatusEnums;
import com.ark.center.iam.domain.permission.enums.PermissionType;
import com.ark.center.iam.domain.permission.gateway.PermissionGateway;
import com.ark.center.iam.infra.permission.assembler.PermissionAssembler;
import com.ark.center.iam.infra.permission.gateway.db.PermissionMapper;
import com.ark.center.iam.infra.permission.gateway.db.PermissionRoleRel;
import com.ark.center.iam.infra.permission.gateway.db.PermissionRoleRelMapper;
import com.ark.component.orm.mybatis.base.BaseEntity;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class PermissionGatewayImpl extends ServiceImpl<PermissionMapper, Permission> implements PermissionGateway {

    private final PermissionRoleRelMapper permissionRoleRelMapper;
    private final PermissionAssembler permissionAssembler;

    @Override
    public List<Permission> selectByType(String permissionType) {
        return lambdaQuery()
                .eq(Permission::getType, permissionType)
                .eq(Permission::getStatus, PermissionStatusEnums.ENABLED.getValue())
                .list();
    }

    @Override
    public List<Permission> selectByTypeAndRoleIds(List<Long> roleIds, String permissionType) {
        if (CollectionUtil.isEmpty(roleIds)) {
            return Collections.emptyList();
        }
        return baseMapper.selectByRoleIdsAndType(roleIds, permissionType);
    }

    @Override
    public void insert(Permission permission) {
        save(permission);
    }

    @Override
    public void deletePermissionAndRoleRelationsByRoleId(Long roleId) {
        LambdaUpdateWrapper<PermissionRoleRel> qw = new LambdaUpdateWrapper<>();
        qw.eq(PermissionRoleRel::getRoleId, roleId);
        permissionRoleRelMapper.delete(qw);
    }

    @Override
    public void deleteRolePermission(Long applicationId, Long roleId, PermissionType permissionType) {
        // 先把关联表id查出来然后排序，再根据id去删除，避免死锁
        List<PermissionRoleRel> permissionRoleRelList = permissionRoleRelMapper
                .selectByRoleIdAndType(applicationId, roleId, permissionType.getType());
        if (CollectionUtils.isNotEmpty(permissionRoleRelList)) {
            List<Long> ids = permissionRoleRelList.stream().map(BaseEntity::getId).sorted().toList();
            permissionRoleRelMapper.deleteBatchIds(ids);
        }
    }

    @Override
    public void insertBatchRolePermissionRelations(Long roleId, List<Long> permissionIds) {
        if (CollectionUtil.isNotEmpty(permissionIds)) {
            permissionRoleRelMapper.batchInsert(roleId, permissionIds);
        }
    }

    @Override
    public List<PermissionDTO> selectRolePermissions(Long applicationId, Long roleId, String permissionType) {
        List<Permission> permissions = this.baseMapper.selectByRoleIdAndType(applicationId, roleId, permissionType);
        return permissions.stream().map(permissionAssembler::toPermissionDTO).collect(Collectors.toList());
    }

    @Override
    public void insertPermission(Long resourceId, PermissionType permissionType) {
        Permission permission = new Permission();
        permission.setType(permissionType.getType());
        permission.setResourceId(resourceId);
        permission.setStatus(PermissionStatusEnums.ENABLED.getValue());
        permission.setCode(generatePermissionCode(permissionType.getTag(), resourceId));
        save(permission);
    }

    /**
     * 生成权限编码
     * 规则：类型首字母+资源id（十位，不足左补0） EXAMPLE：P0000000001
     */
    private String generatePermissionCode(String tag, long id) {
        return tag + StringUtils.leftPad(String.valueOf(id), 9, "0");
    }

    @Override
    public void deleteByResourceIds(List<Long> resourceIds) {
        lambdaUpdate()
                .in(Permission::getResourceId, resourceIds)
                .remove();
    }

    @Override
    public List<ApiPermissionVO> selectApiPermissionsByRoleIds(List<Long> roleIds) {
        return baseMapper.selectApiPermissionsByRoleIds(roleIds);
    }

    @Override
    public List<Long> selectResourceIdsByIds(List<Long> permissionIds) {
        return lambdaQuery()
                .select(Permission::getResourceId)
                .in(BaseEntity::getId, permissionIds)
                .eq(Permission::getIsDeleted, 0)
                .list().stream()
                .map(Permission::getResourceId)
                .collect(Collectors.toList());
    }

}
