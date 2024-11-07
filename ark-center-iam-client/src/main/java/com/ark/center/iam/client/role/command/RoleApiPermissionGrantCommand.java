package com.ark.center.iam.client.role.command;


import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.List;


@Data
@Schema(description = "角色授权API权限命令")
public class RoleApiPermissionGrantCommand {

    @Schema(description = "应用id")
    @NotNull
    private Long applicationId;

    @Schema(description = "角色id")
    @NotNull
    private Long roleId;

    @Schema(description = "需要添加的权限id")
    private List<Long> toAddApiPermissionIds;

    @Schema(description = "需要删除的权限id")
    private List<Long> toRemoveApiPermissionIds;

}
