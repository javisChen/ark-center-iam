package com.ark.center.iam.data.permission.converter;

import com.ark.center.iam.dao.entity.IamPermission;
import com.ark.center.iam.client.permission.vo.PermissionDTO;
import org.springframework.stereotype.Component;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@Component
public class PermissionBeanConverter {

    public PermissionDTO convertToVO(IamPermission iamPermission) {
        PermissionDTO vo = new PermissionDTO();
        vo.setPermissionId(iamPermission.getId());
        return vo;
    }
}
