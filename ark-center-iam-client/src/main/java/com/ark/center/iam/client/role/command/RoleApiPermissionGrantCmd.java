package com.ark.center.iam.client.role.command;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

/**
 * 角色路由授权入参
 */
@Data
public class RoleApiPermissionGrantCmd {

    @Schema(name = "应用id")
    private Long applicationId;

    @Schema(name = "角色id")
    private Long roleId;

    @Schema(name = "权限id")
    private List<Long> toAddApiPermissionIds;

    // private List<Long> toRemoveApiPermissionIds;

}
