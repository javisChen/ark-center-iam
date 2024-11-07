package com.ark.center.iam.client.role.command;


import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.List;

/**
 * 角色路由授权入参
 */
@Data
@Schema(description = "角色授权菜单权限命令")
public class RoleMenuPermissionGrantCommand {

    @Schema(description = "应用id")
    @NotNull
    private Long applicationId;

    @Schema(description = "角色Id")
    @NotNull
    private Long roleId;

    @Schema(description = "待添加的菜单权限id集合")
    private List<Long> toAddMenuPermissionIds;

    @Schema(description = "待删除的菜单权限id集合")
    private List<Long> toRemoveMenuPermissionIds;

    @Schema(description = "待添加的页面元素权限id集合")
    private List<Long> toAddElementPermissionIds;

    @Schema(description = "待删除的页面元素权限id集合")
    private List<Long> toRemoveElementPermissionIds;

}
