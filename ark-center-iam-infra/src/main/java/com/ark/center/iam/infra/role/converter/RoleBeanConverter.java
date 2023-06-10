package com.ark.center.iam.infra.role.converter;

import com.ark.center.iam.client.role.command.RoleCmd;
import com.ark.center.iam.client.role.dto.RoleListDTO;
import com.ark.center.iam.domain.role.Role;
import org.springframework.stereotype.Component;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@Component
public class RoleBeanConverter {

    public RoleListDTO toRoleListDTO(Role role) {
        RoleListDTO roleListVO = new RoleListDTO();
        roleListVO.setId(role.getId());
        roleListVO.setName(role.getName());
        roleListVO.setCode(role.getCode());
        roleListVO.setCreateTime(role.getGmtCreate());
        roleListVO.setUpdateTime(role.getGmtModified());
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
