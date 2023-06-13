package com.ark.center.iam.infra.usergroup.assembler;//package com.ark.center.iam.infra.usergroup.assembler;

import com.ark.center.iam.client.usergroup.command.UserGroupCmd;
import com.ark.center.iam.client.usergroup.dto.UserGroupBaseDTO;
import com.ark.center.iam.client.usergroup.dto.UserGroupDetailDTO;
import com.ark.center.iam.client.usergroup.dto.UserGroupListTreeDTO;
import com.ark.center.iam.domain.usergroup.UserGroup;
import org.mapstruct.Mapper;

import java.util.ArrayList;

@Mapper(componentModel = "spring")
public interface UserGroupAssembler {

    default UserGroupListTreeDTO convertToUserGroupListTreeDTO(UserGroup item) {
        UserGroupListTreeDTO DTO = new UserGroupListTreeDTO();
        DTO.setId(item.getId());
        DTO.setPid(item.getPid());
        DTO.setName(item.getName());
        DTO.setStatus(item.getStatus());
        DTO.setCreateTime(item.getGmtCreate());
        DTO.setUpdateTime(item.getGmtModified());
        DTO.setInheritType(item.getInheritType());
        DTO.setType(item.getType());
        DTO.setChildren(new ArrayList<>());
//        DTO.setRoles(iRoleService.getRoleNamesByUserGroupId(item.getId()));
        return DTO;
    }

    public default UserGroup convertToDO(UserGroupCmd dto) {
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

    UserGroupBaseDTO toBaseDTO(UserGroup userGroup);

    UserGroupDetailDTO toUserGroupDetailsDTO(UserGroup userGroup);
}
