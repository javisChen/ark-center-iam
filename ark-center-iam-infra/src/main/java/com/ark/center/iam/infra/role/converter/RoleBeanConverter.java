package com.ark.center.iam.infra.role.converter;

import com.ark.center.iam.client.role.command.RoleCmd;
import com.ark.center.iam.client.role.dto.RoleBaseDTO;
import com.ark.center.iam.infra.role.Role;
import org.springframework.stereotype.Component;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@Component
public class RoleBeanConverter {

    public RoleBaseDTO toRoleBaseDTO(Role role) {
        RoleBaseDTO roleListVO = new RoleBaseDTO();
        roleListVO.setId(role.getId());
        roleListVO.setName(role.getName());
        roleListVO.setCode(role.getCode());
        roleListVO.setCreateTime(role.getCreateTime());
        roleListVO.setUpdateTime(role.getUpdateTime());
        return roleListVO;
    }

    public Role convertToDO(RoleCmd dto) {
        Role role = new Role();
        role.setId(dto.getId());
        role.setCode(dto.getCode());
        role.setName(dto.getName());
        role.setStatus(dto.getStatus());
        return role;
    }
}
