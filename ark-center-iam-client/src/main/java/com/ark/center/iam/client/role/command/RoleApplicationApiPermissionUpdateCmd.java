package com.ark.center.iam.client.role.command;


import lombok.Data;

/**
 * 角色路由授权入参（直接授予应用下的所有api）
 */
@Data
public class RoleApplicationApiPermissionUpdateCmd {

    private Long applicationId;

}
