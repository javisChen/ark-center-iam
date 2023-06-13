package com.ark.center.iam.client.role.command;


import lombok.Data;

import java.io.Serializable;

/**
 * 角色路由授权入参（直接授予应用下的所有api）
 */
@Data
public class RoleApplicationApiPermissionUpdateDTO  {

    

    private Long applicationId;

}
