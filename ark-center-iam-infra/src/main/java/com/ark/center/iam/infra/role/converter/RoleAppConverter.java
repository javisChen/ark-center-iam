package com.ark.center.iam.infra.role.converter;

import com.ark.center.iam.domain.role.Role;
import com.ark.center.iam.infra.role.repository.db.RoleDO;
import com.ark.center.iam.model.role.command.RoleCreateCommand;
import com.ark.center.iam.model.role.dto.RoleBaseDTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface RoleAppConverter {

    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "createTime", ignore = true)
    @Mapping(target = "creator", ignore = true)
    Role toRoleDO(RoleCreateCommand cmd);

    RoleBaseDTO toRoleBaseDTO(RoleDO role);
}
