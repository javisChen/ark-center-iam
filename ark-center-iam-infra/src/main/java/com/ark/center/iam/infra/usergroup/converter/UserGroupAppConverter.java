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

    UserGroupDetailDTO toUserGroupDetailsDTO(UserGroup userGroup);

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
