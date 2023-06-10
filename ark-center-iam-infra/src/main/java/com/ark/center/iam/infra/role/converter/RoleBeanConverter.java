package com.ark.center.iam.infra.role.converter;

import com.ark.center.iam.client.role.command.RoleUpdateDTO;
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

    public RoleListDTO convertToRoleListVO(Role item) {
        RoleListDTO roleListVO = new RoleListDTO();
        roleListVO.setId(item.getId());
        roleListVO.setName(item.getName());
        roleListVO.setCode(item.getCode());
        roleListVO.setCreateTime(item.getGmtCreate());
        roleListVO.setUpdateTime(item.getGmtModified());
        return roleListVO;
    }

    public Role convertToDO(RoleUpdateDTO dto) {
        Role role = new Role();
        role.setId(dto.getId());
        role.setCode(dto.getCode());
        role.setName(dto.getName());
        role.setStatus(dto.getStatus());
        return role;
    }
}
