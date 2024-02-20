package com.ark.center.iam.infra.permission.repository.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.domain.api.vo.ApiPermissionVO;
import com.ark.center.iam.domain.permission.ResourcePermission;
import com.ark.center.iam.domain.permission.repository.ResourcePermissionRepository;
import com.ark.center.iam.domain.permission.vo.PermissionType;
import com.ark.center.iam.infra.permission.converter.PermissionDomainConverter;
import com.ark.center.iam.infra.permission.repository.db.PermissionDAO;
import com.ark.center.iam.infra.permission.repository.db.PermissionMapper;
import com.ark.center.iam.infra.relation.db.PermissionRoleRelDO;
import com.ark.center.iam.infra.relation.db.PermissionRoleRelMapper;
import com.ark.center.iam.model.permission.vo.PermissionDTO;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import lombok.RequiredArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class ResourceResourcePermissionRepositoryImpl extends BaseDBRepository<ResourcePermission, Long> implements ResourcePermissionRepository {

    private final PermissionRoleRelMapper permissionRoleRelMapper;
    private final PermissionDomainConverter permissionDomainConverter;
    private final PermissionMapper permissionMapper;
    private final PermissionDAO permissionDAO;

    @Override
    public List<ResourcePermission> selectByType(PermissionType permissionType) {
        return permissionDAO.lambdaQuery()
                .eq(ResourcePermission::getType, permissionType.getName())
                .eq(ResourcePermission::getStatus, EnableDisableStatus.ENABLED.getValue())
                .list();
    }

    @Override
    public List<ResourcePermission> selectByTypeAndRoleIds(List<Long> roleIds, PermissionType permissionType) {
        if (CollectionUtil.isEmpty(roleIds)) {
            return Collections.emptyList();
        }
        return permissionDAO.getBaseMapper().selectByRoleIdsAndType(roleIds, permissionType.getName());
    }

    @Override
    public void save(ResourcePermission resourcePermission) {
        permissionDAO.saveOrUpdate(resourcePermission);
    }

    @Override
    public void delete(ResourcePermission resourcePermission) {

    }

    @Override
    public void deletePermissionAndRoleRelationsByRoleId(Long roleId) {
        LambdaUpdateWrapper<PermissionRoleRelDO> qw = new LambdaUpdateWrapper<>();
        qw.eq(PermissionRoleRelDO::getRoleId, roleId);
        permissionRoleRelMapper.delete(qw);
    }

    @Override
    public void deleteRolePermission(Long applicationId, Long roleId, PermissionType permissionType) {
        // 先把关联表id查出来然后排序，再根据id去删除，避免死锁
        List<PermissionRoleRelDO> permissionRoleRelDOList = permissionRoleRelMapper
                .selectByRoleIdAndType(applicationId, roleId, permissionType.getName());
        if (CollectionUtils.isNotEmpty(permissionRoleRelDOList)) {
            List<Long> ids = permissionRoleRelDOList.stream().map(AggregateRoot::getId).sorted().toList();
            permissionRoleRelMapper.deleteBatchIds(ids);
        }
    }

    @Override
    public void deleteRolePermissionByIds(Long applicationId, Long roleId, List<Long> toRemoveApiPermissionIds) {
        if (CollectionUtil.isEmpty(toRemoveApiPermissionIds)) {
            return;
        }
        // 先把关联表id查出来然后排序，再根据id去删除，避免死锁
        List<PermissionRoleRelDO> permissionRoleRelDOList = permissionRoleRelMapper
                .selectByPermissionIdAndRoleId(applicationId, roleId, toRemoveApiPermissionIds);
        if (CollectionUtils.isNotEmpty(permissionRoleRelDOList)) {
            List<Long> ids = permissionRoleRelDOList.stream().map(AggregateRoot::getId).sorted().toList();
            permissionRoleRelMapper.deleteBatchIds(ids);
        }
    }

    @Override
    public List<ResourcePermission> byResourceIdsAndType(List<Long> resourcesIds, PermissionType type) {
        List<ResourcePermission> resourcePermissions = permissionDAO.lambdaQuery()
                .in(ResourcePermission::getResourceId, resourcesIds)
                .eq(ResourcePermission::getType, type.getName())
                .list();
        return permissionDomainConverter.toDomain(resourcePermissions);
    }

    @Override
    public void insertBatchRolePermissionRelations(Long roleId, List<Long> permissionIds) {
        if (CollectionUtil.isNotEmpty(permissionIds)) {
            permissionRoleRelMapper.batchInsert(roleId, permissionIds);
        }
    }

    @Override
    public List<PermissionDTO> selectRolePermissions(Long applicationId, Long roleId, String permissionType) {
        List<ResourcePermission> resourcePermissions = this.permissionMapper.selectByRoleIdAndType(applicationId, roleId, permissionType);
        return resourcePermissions.stream().map(permissionDomainConverter::toPermissionDTO).collect(Collectors.toList());
    }

    @Override
    public void insertPermission(Long id, PermissionType permissionType) {

    }

//    @Override
//    public void insertPermission(Long resourceId, PermissionType permissionType) {
//        Permission permission = new Permission();
//        permission.setType(permissionType.getName());
//        permission.setResourceId(resourceId);
//        permission.setStatus(PermissionStatusEnums.ENABLED.getValue());
//        permission.setCode(generatePermissionCode(permissionType.getTag(), resourceId));
//        permissionMapper.insert(permission);
//    }

    /**
     * 生成权限编码
     * 规则：类型首字母+资源id（十位，不足左补0） EXAMPLE：P0000000001
     */
    private String generatePermissionCode(String tag, long id) {
        return tag + StringUtils.leftPad(String.valueOf(id), 9, "0");
    }

    @Override
    public void deleteByResourceIds(List<Long> resourceIds) {
        permissionDAO.lambdaUpdate()
                .in(ResourcePermission::getResourceId, resourceIds);
    }

    @Override
    public List<ApiPermissionVO> selectApiPermissionsByRoleIds(List<Long> roleIds) {
        return permissionMapper.selectApiPermissionsByRoleIds(roleIds);
    }

    @Override
    public List<Long> selectResourceIdsByIds(List<Long> permissionIds) {
        return permissionDAO.lambdaQuery()
                .select(ResourcePermission::getResourceId)
                .in(AggregateRoot::getId, permissionIds)
                .list()
                .stream()
                .map(ResourcePermission::getResourceId)
                .toList();
    }

    @Override
    public void deleteAll(List<ResourcePermission> resourcePermissions) {
        permissionDAO.lambdaUpdate()
                .in(AggregateRoot::getId, resourcePermissions.stream().map(AggregateRoot::getId).toList())
                .remove();
    }

    @Override
    public ResourcePermission byId(Long id) {
        return null;
    }
}
