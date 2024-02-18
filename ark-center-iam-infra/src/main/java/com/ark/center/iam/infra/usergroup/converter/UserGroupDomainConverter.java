package com.ark.center.iam.infra.usergroup.converter;//package com.ark.center.iam.infra.usergroup.assembler;

import com.ark.center.iam.domain.usergroup.UserGroup;
import com.ark.center.iam.infra.usergroup.repository.db.UserGroupDO;
import com.ark.center.iam.model.usergroup.command.UserGroupCreateCommand;
import com.ark.center.iam.model.usergroup.dto.UserGroupBaseDTO;
import com.ark.center.iam.model.usergroup.dto.UserGroupDetailDTO;
import com.ark.center.iam.model.usergroup.dto.UserGroupListTreeDTO;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.ArrayList;
import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface UserGroupDomainConverter {

    default UserGroupListTreeDTO convertToUserGroupListTreeDTO(UserGroup item) {
        UserGroupListTreeDTO DTO = new UserGroupListTreeDTO();
        DTO.setId(item.getId());
        DTO.setPid(item.getPid());
        DTO.setName(item.getName());
        DTO.setStatus(item.getStatus());
        DTO.setCreateTime(item.getCreateTime());
        DTO.setUpdateTime(item.getUpdateTime());
        DTO.setInheritType(item.getInheritType());
        DTO.setType(item.getType());
        DTO.setChildren(new ArrayList<>());
//        DTO.setRoles(iRoleService.getRoleNamesByUserGroupId(item.getId()));
        return DTO;
    }

    public default UserGroup convertToDO(UserGroupCreateCommand dto) {
        UserGroup userGroup = new UserGroup();
        userGroup.setId(dto.getId());
        userGroup.setName(dto.getName());
        userGroup.setPid(dto.getPid());
        userGroup.setInheritType(dto.getInheritType());
        userGroup.setType(dto.getType());
        userGroup.setPid(dto.getPid());
        return userGroup;
    }

    public default UserGroupDetailDTO convertToUserGroupDetailDTO(UserGroup userGroup) {
        UserGroupDetailDTO DTO = new UserGroupDetailDTO();
        DTO.setId(userGroup.getId());
        DTO.setPid(userGroup.getPid());
        DTO.setName(userGroup.getName());
        DTO.setStatus(userGroup.getStatus());
        DTO.setLevel(userGroup.getLevel());
//        DTO.setRoleIds(iRoleService.getRoleIdsByUserGroupId(userGroup.getId()));
        DTO.setInheritType(userGroup.getInheritType());
        DTO.setType(userGroup.getType());
        DTO.setLevelPath(userGroup.getLevelPath());
        return DTO;
    }

    UserGroupBaseDTO toBaseDTO(UserGroupDO userGroup);
    List<UserGroupBaseDTO> toBaseDTO(List<UserGroupDO> userGroups);

    UserGroupDetailDTO toUserGroupDetailsDTO(UserGroup userGroup);

    default UserGroupDO fromDomain(UserGroup it) {
        UserGroupDO userGroupDO = new UserGroupDO();
        userGroupDO.setName(it.getName());
        userGroupDO.setPid(it.getPid());
        userGroupDO.setStatus(it.getStatus().getValue());
        userGroupDO.setLevel(it.getHierarchy().getLevel());
        userGroupDO.setLevelPath(it.getHierarchy().getPath());
        userGroupDO.setInheritType(it.getInheritType().getValue());
        userGroupDO.setType(it.getType().getValue());
        userGroupDO.setId(it.getId());
        return userGroupDO;
    }
}
