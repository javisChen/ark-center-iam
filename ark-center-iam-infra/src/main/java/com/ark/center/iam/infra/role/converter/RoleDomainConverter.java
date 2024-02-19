package com.ark.center.iam.infra.role.converter;

import com.ark.center.iam.domain.role.Role;
import com.ark.center.iam.infra.role.repository.db.RoleDO;
import com.ark.center.iam.model.role.command.RoleCreateCommand;
import com.ark.center.iam.model.role.dto.RoleBaseDTO;
import com.ark.component.ddd.domain.vo.EnableDisableStatus;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface RoleDomainConverter {

    @Mapping(target = "modifier", ignore = true)
    @Mapping(target = "isDeleted", ignore = true)
    @Mapping(target = "updateTime", ignore = true)
    @Mapping(target = "createTime", ignore = true)
    @Mapping(target = "creator", ignore = true)
    Role toRoleDO(RoleCreateCommand cmd);

    RoleBaseDTO toRoleBaseDTO(Role role);

    default RoleDO fromDomain(Role role) {
        RoleDO roleDO = new RoleDO();
        roleDO.setName(role.getName());
        roleDO.setCode(role.getCode());
        roleDO.setStatus(role.getStatus().getValue());
        roleDO.setId(role.getId());
        return roleDO;
    }

    default Role toDomain(RoleDO roleDO) {
        if (roleDO == null) {
            return null;
        }
        return Role.builder()
                .name(roleDO.getName())
                .code(roleDO.getCode())
                .status(EnableDisableStatus.from(roleDO.getStatus()))
                .build();
    }
}
