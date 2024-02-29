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

    default UserGroupDO fromDomain(UserGroup userGroup) {
        UserGroupDO userGroupDO = new UserGroupDO();
        userGroupDO.setName(userGroup.getName());
        userGroupDO.setPid(userGroup.getPid());
        userGroupDO.setStatus(userGroup.getStatus().getValue());
        Hierarchy hierarchy = userGroup.getHierarchy();
        userGroupDO.setLevel(hierarchy.getLevel());
        userGroupDO.setLevelPath(hierarchy.getPath());
        userGroupDO.setInheritType(userGroup.getInheritType().getValue());
        userGroupDO.setType(userGroup.getType().getValue());
        userGroupDO.setId(userGroup.getId());
        return userGroupDO;
    }

    default UserGroup toDomain(UserGroupDO groupDO, List<Long> roleIds) {
        UserGroup userGroup = new UserGroup();
        userGroup.setId(groupDO.getId());
        userGroup.setName(groupDO.getName());
        userGroup.setPid(groupDO.getPid());
        userGroup.setStatus(EnableDisableStatus.from(groupDO.getStatus()));
        userGroup.setHierarchy(new Hierarchy(userGroup.getId(), Parent.of(groupDO.getPid(), groupDO.getLevel(), groupDO.getLevelPath())));
        userGroup.setInheritType(InheritType.from(groupDO.getInheritType()));
        userGroup.setType(UserGroupType.from(groupDO.getType()));
        userGroup.setRoleIds(roleIds);
        return userGroup;
    }
}
