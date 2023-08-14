package com.ark.center.iam.client.role.command;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

/**
 * 角色路由授权入参
 */
@Data
public class RoleRoutePermissionGrantCmd {


    @Schema(name = "应用id")
    private Long applicationId;

    @Schema(name = "角色Id")
    private Long roleId;

    @Schema(name = "待添加的路由权限id集合")
    private List<Long> toAddRoutePermissionIds;

    @Schema(name = "待删除的路由权限id集合")
    private List<Long> toRemoveRoutePermissionIds;

    @Schema(name = "待添加的页面元素权限id集合")
    private List<Long> toAddElementPermissionIds;

    @Schema(name = "待删除的页面元素权限id集合")
    private List<Long> toRemoveElementPermissionIds;

}
