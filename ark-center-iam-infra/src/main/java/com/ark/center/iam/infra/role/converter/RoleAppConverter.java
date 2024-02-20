package com.ark.center.iam.infra.role.converter;

import com.ark.center.iam.infra.role.repository.db.RoleDO;
import com.ark.center.iam.model.role.dto.RoleBaseDTO;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface RoleAppConverter {

    RoleBaseDTO toRoleBaseDTO(RoleDO role);
}
