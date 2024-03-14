package com.ark.center.iam.model.role.command;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

/**
 * 角色路由授权入参
 */
@Data
public class RolePermissionGrantCmd {

    @Schema(description = "应用id")
    private Long applicationId;

    @Schema(description = "角色Id")
    private Long roleId;

    @Schema(description = "待添加的路由权限id集合")
    private List<Long> toAddRoutePermissionIds;

    @Schema(description = "待删除的路由权限id集合")
    private List<Long> toRemoveRoutePermissionIds;

    @Schema(description = "待添加的页面元素权限id集合")
    private List<Long> toAddElementPermissionIds;

    @Schema(description = "待删除的页面元素权限id集合")
    private List<Long> toRemoveElementPermissionIds;

    @Schema(description = "待添加的Api权限id")
    private List<Long> toAddApiPermissionIds;

    @Schema(description = "待删除的Api权限id")
    private List<Long> toRemoveApiPermissionIds;

}
