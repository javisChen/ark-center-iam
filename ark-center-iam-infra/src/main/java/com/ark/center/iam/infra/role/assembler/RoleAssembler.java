package com.ark.center.iam.infra.role.assembler;

import com.ark.center.iam.client.role.command.RoleCmd;
import com.ark.center.iam.client.role.dto.RoleBaseDTO;
import com.ark.center.iam.domain.role.Role;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface RoleAssembler {

    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "createTime", ignore = true)
    @Mapping(target = "creator", ignore = true)
    Role toRoleDO(RoleCmd cmd);

    RoleBaseDTO toRoleBaseDTO(Role role);
}
