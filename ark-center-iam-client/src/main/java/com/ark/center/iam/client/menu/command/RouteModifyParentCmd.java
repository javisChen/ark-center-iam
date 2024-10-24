package com.ark.center.iam.client.menu.command;


import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
@Schema(description = "路由层级变更命令")
public class RouteModifyParentCmd {


    @NotNull(message = "id 不能为空")
    @Schema(description = "路由id", requiredMode = Schema.RequiredMode.REQUIRED)
    private Long id;

    @NotNull(message = "parentId 不能为空")
    @Schema(description = "父级路由id", requiredMode = Schema.RequiredMode.REQUIRED)
    private Long parentId;

}
