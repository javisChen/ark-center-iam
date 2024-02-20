package com.ark.center.iam.infra.usergroup.converter;//package com.ark.center.iam.infra.usergroup.assembler;

import com.ark.center.iam.domain.common.hierarchy.Hierarchy;
import com.ark.center.iam.domain.common.hierarchy.Parent;
import com.ark.center.iam.domain.usergroup.UserGroup;
import com.ark.center.iam.domain.usergroup.vo.InheritType;
import com.ark.center.iam.domain.usergroup.vo.UserGroupType;
import com.ark.center.iam.infra.usergroup.repository.db.UserGroupDO;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface UserGroupDomainConverter {

    default UserGroupDO fromDomain(UserGroup it) {
        UserGroupDO userGroupDO = new UserGroupDO();
        userGroupDO.setName(it.getName());
        userGroupDO.setPid(it.getPid());
        userGroupDO.setStatus(it.getStatus().getValue());
        Hierarchy hierarchy = it.getHierarchy();
        userGroupDO.setLevel(hierarchy.getLevel());
        userGroupDO.setLevelPath(hierarchy.getPath());
        userGroupDO.setInheritType(it.getInheritType().getValue());
        userGroupDO.setType(it.getType().getValue());
        userGroupDO.setId(it.getId());
        return userGroupDO;
    }

    default UserGroup toDomain(UserGroupDO groupDO, List<Long> roleIds) {
        return UserGroup.builder()
        		.name(groupDO.getName())
        		.pid(groupDO.getPid())
        		.status(EnableDisableStatus.from(groupDO.getStatus()))
        		.hierarchy(Hierarchy.builder()
                        .path(groupDO.getLevelPath())
                        .parent(Parent.of(groupDO.getPid(), groupDO.getLevel(), groupDO.getLevelPath()))
                        .build())
        		.inheritType(InheritType.from(groupDO.getInheritType()))
        		.type(UserGroupType.from(groupDO.getType()))
        		.roleIds(roleIds)
        		.build();
    }
}
