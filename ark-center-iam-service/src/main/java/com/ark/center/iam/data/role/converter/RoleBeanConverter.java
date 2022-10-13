package com.ark.center.iam.data.role.converter;

import com.ark.center.iam.dao.entity.IamRole;
import com.ark.center.iam.data.role.dto.RoleUpdateDTO;
import com.ark.center.iam.data.role.vo.RoleListVO;
import org.springframework.stereotype.Component;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@Component
public class RoleBeanConverter {

    public RoleListVO convertToRoleListVO(IamRole item) {
        RoleListVO roleListVO = new RoleListVO();
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
