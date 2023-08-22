package com.ark.center.iam.client.role.command;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

/**
 * 角色路由授权入参
 */
@Data
public class RoleApiPermissionGrantCmd {

    @Schema(description = "应用id")
    private Long applicationId;

    @Schema(description = "角色id")
    private Long roleId;

    @Schema(description = "需要添加的权限id")
    private List<Long> toAddApiPermissionIds;

    @Schema(description = "需要删除的权限id")
    private List<Long> toRemoveApiPermissionIds;

}
