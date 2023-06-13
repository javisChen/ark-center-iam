package com.ark.center.iam.client.role.command;


import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 角色路由授权入参
 */
@Data
public class RoleApiPermissionUpdateDTO  {

    

    private Long roleId;
    private List<Long> toAddApiPermissionIds;
    private List<Long> toRemoveApiPermissionIds;

}
