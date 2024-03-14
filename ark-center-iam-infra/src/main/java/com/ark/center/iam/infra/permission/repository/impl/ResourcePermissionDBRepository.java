package com.ark.center.iam.infra.permission.repository.impl;

import com.ark.center.iam.domain.permission.ResourcePermission;
import com.ark.center.iam.domain.permission.repository.ResourcePermissionRepository;
import com.ark.center.iam.domain.permission.vo.PermissionType;
import com.ark.center.iam.infra.permission.converter.PermissionDomainConverter;
import com.ark.center.iam.infra.permission.repository.db.PermissionDAO;
import com.ark.center.iam.infra.permission.repository.db.PermissionDO;
import com.ark.center.iam.infra.permission.repository.db.PermissionMapper;
import com.ark.center.iam.infra.relation.db.PermissionRoleRelMapper;
import com.ark.component.ddd.domain.AggregateRoot;
import com.ark.component.ddd.infrastructure.BaseDBRepository;
import com.ark.component.orm.mybatis.base.BaseEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ResourcePermissionDBRepository extends BaseDBRepository<ResourcePermission, Long> implements ResourcePermissionRepository {

    private final PermissionDomainConverter permissionDomainConverter;
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
    public List<ResourcePermission> byResourceIdsAndType(List<Long> resourcesIds, PermissionType type) {
        List<PermissionDO> permissions = permissionDAO.lambdaQuery()
                .in(PermissionDO::getResourceId, resourcesIds)
                .eq(PermissionDO::getType, type.getName())
                .list();
        return permissionDomainConverter.toDomain(permissions);
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
