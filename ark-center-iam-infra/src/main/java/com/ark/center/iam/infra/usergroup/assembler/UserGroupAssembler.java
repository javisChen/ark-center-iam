package com.ark.center.iam.infra.usergroup.assembler;//package com.ark.center.iam.infra.usergroup.assembler;

import com.ark.center.iam.client.usergroup.command.UserGroupCommand;
import com.ark.center.iam.client.usergroup.dto.UserGroupBaseDTO;
import com.ark.center.iam.client.usergroup.dto.UserGroupDetailDTO;
import com.ark.center.iam.client.usergroup.dto.UserGroupListTreeDTO;
import com.ark.center.iam.infra.usergroup.UserGroup;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.ArrayList;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface UserGroupAssembler {

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

    public default UserGroup convertToDO(UserGroupCommand dto) {
        UserGroup userGroup = new UserGroup();
        userGroup.setId(dto.getId());
        userGroup.setName(dto.getName());
        userGroup.setPid(dto.getParentId());
        userGroup.setInheritType(dto.getInheritType());
        userGroup.setType(dto.getType());
        userGroup.setPid(dto.getParentId());
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

    UserGroupBaseDTO toBaseDTO(UserGroup userGroup);

    UserGroupDetailDTO toUserGroupDetailsDTO(UserGroup userGroup);
}
