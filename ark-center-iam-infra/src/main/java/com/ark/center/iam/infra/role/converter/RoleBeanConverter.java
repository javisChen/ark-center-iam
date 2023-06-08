package com.ark.center.iam.infra.role.converter;

import com.ark.center.iam.client.role.command.RoleUpdateDTO;
import com.ark.center.iam.client.role.dto.RoleListDTO;
import com.ark.center.iam.infra.role.gateway.db.IamRole;
import org.springframework.stereotype.Component;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@Component
public class RoleBeanConverter {

    public RoleListDTO convertToRoleListVO(IamRole item) {
        RoleListDTO roleListVO = new RoleListDTO();
        roleListVO.setId(item.getId());
        roleListVO.setName(item.getName());
        roleListVO.setCode(item.getCode());
        roleListVO.setCreateTime(item.getGmtCreate());
        roleListVO.setUpdateTime(item.getGmtModified());
        return roleListVO;
    }

    public IamRole convertToDO(RoleUpdateDTO dto) {
        IamRole iamRole = new IamRole();
        iamRole.setId(dto.getId());
        iamRole.setCode(dto.getCode());
        iamRole.setName(dto.getName());
        iamRole.setStatus(dto.getStatus());
        return iamRole;
    }
}
