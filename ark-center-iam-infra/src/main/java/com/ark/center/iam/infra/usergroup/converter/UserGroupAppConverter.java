package com.ark.center.iam.infra.usergroup.converter;//package com.ark.center.iam.infra.usergroup.assembler;

import com.ark.center.iam.domain.usergroup.UserGroup;
import com.ark.center.iam.infra.usergroup.repository.db.UserGroupDO;
import com.ark.center.iam.model.usergroup.dto.UserGroupBaseDTO;
import com.ark.center.iam.model.usergroup.dto.UserGroupDetailDTO;
import com.ark.center.iam.model.usergroup.dto.UserGroupListTreeDTO;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface UserGroupAppConverter {

    List<UserGroupBaseDTO> toBaseDTO(List<UserGroupDO> userGroup);

    default UserGroupDetailDTO toUserGroupDetailsDTO(UserGroup userGroup) {
        UserGroupDetailDTO userGroupDetailDTO = new UserGroupDetailDTO();
        userGroupDetailDTO.setRoleIds(userGroup.getRoleIds());
        userGroupDetailDTO.setId(userGroup.getId());
        userGroupDetailDTO.setPid(userGroup.getPid());
        userGroupDetailDTO.setName(userGroup.getName());
        userGroupDetailDTO.setStatus(userGroup.getStatus().getValue());
        userGroupDetailDTO.setLevel(userGroup.getHierarchy().getLevel());
        userGroupDetailDTO.setLevelPath(userGroup.getHierarchy().getPath());
        userGroupDetailDTO.setInheritType(userGroup.getInheritType().getValue());
        userGroupDetailDTO.setType(userGroup.getType().getValue());
        return userGroupDetailDTO;
    }

    default UserGroupListTreeDTO toUserGroupListTreeDTO(UserGroupDO item) {
        UserGroupListTreeDTO userGroupListTreeDTO = new UserGroupListTreeDTO();
        userGroupListTreeDTO.setCreateTime(item.getCreateTime());
        userGroupListTreeDTO.setUpdateTime(item.getUpdateTime());
        userGroupListTreeDTO.setId(item.getId());
        userGroupListTreeDTO.setPid(item.getPid());
        userGroupListTreeDTO.setName(item.getName());
        userGroupListTreeDTO.setStatus(item.getStatus());
        userGroupListTreeDTO.setLevel(item.getLevel());
        userGroupListTreeDTO.setLevelPath(item.getLevelPath());
        userGroupListTreeDTO.setInheritType(item.getInheritType());
        userGroupListTreeDTO.setType(item.getType());
        return userGroupListTreeDTO;
    }
}
