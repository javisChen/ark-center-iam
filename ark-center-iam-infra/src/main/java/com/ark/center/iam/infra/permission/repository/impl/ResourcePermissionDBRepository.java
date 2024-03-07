package com.ark.center.iam.infra.permission.repository.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.ark.center.iam.domain.permission.ResourcePermission;
import com.ark.center.iam.domain.permission.repository.ResourcePermissionRepository;
import com.ark.center.iam.domain.permission.vo.PermissionType;
import com.ark.center.iam.infra.permission.converter.PermissionDomainConverter;
import com.ark.center.iam.infra.permission.repository.db.PermissionDAO;
import com.ark.center.iam.infra.permission.repository.db.PermissionDO;
import com.ark.center.iam.infra.permission.repository.db.PermissionMapper;
import com.ark.center.iam.infra.relation.db.PermissionRoleRelDO;
import com.ark.center.iam.infra.relation.db.PermissionRoleRelMapper;
import com.ark.center.iam.model.permission.vo.PermissionDTO;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import com.ark.component.orm.mybatis.base.BaseEntity;
import lombok.RequiredArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class ResourcePermissionDBRepository extends BaseDBRepository<ResourcePermission, Long> implements ResourcePermissionRepository {

    private final PermissionRoleRelMapper permissionRoleRelMapper;
    private final PermissionDomainConverter permissionDomainConverter;
    private final PermissionMapper permissionMapper;
    private final PermissionDAO permissionDAO;

    @Override
    public void save(ResourcePermission resourcePermission) {
        PermissionDO permissionDO = permissionDomainConverter.fromDomain(resourcePermission);
        permissionDAO.saveOrUpdate(permissionDO);
    }

    @Override
    public void delete(ResourcePermission resourcePermission) {

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
            List<Long> ids = permissionRoleRelDOList.stream().map(BaseEntity::getId).sorted().collect(Collectors.toList());
            permissionRoleRelMapper.deleteBatchIds(ids);
        }
    }

    @Override
    public List<ResourcePermission> byResourceIdsAndType(List<Long> resourcesIds, PermissionType type) {
        List<PermissionDO> permissions = permissionDAO.lambdaQuery()
                .in(PermissionDO::getResourceId, resourcesIds)
                .eq(PermissionDO::getType, type.getName())
                .list();
        return permissionDomainConverter.toDomain(permissions);
    }

    @Override
    public void insertBatchRolePermissionRelations(Long roleId, List<Long> permissionIds) {
        if (CollectionUtil.isNotEmpty(permissionIds)) {
            permissionRoleRelMapper.batchInsert(roleId, permissionIds);
        }
    }

    @Override
    public List<PermissionDTO> selectRolePermissions(Long applicationId, Long roleId, String permissionType) {
        List<PermissionDO> resourcePermissions = this.permissionMapper.selectByRoleIdAndType(applicationId, roleId, permissionType);
        return resourcePermissions.stream().map(permissionDomainConverter::toPermissionDTO).collect(Collectors.toList());
    }

    @Override
    public void deleteAll(List<ResourcePermission> resourcePermissions) {
        permissionDAO.lambdaUpdate()
                .in(BaseEntity::getId, resourcePermissions.stream().map(AggregateRoot::getId).toList())
                .remove();
    }

    @Override
    public ResourcePermission byId(Long id) {
        return null;
    }
}
