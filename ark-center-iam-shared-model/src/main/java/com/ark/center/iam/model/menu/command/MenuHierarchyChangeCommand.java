package com.ark.center.iam.model.menu.command;


import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
@Schema(description = "修改菜单层级命令")
public class MenuHierarchyChangeCommand {


    @NotNull(message = "id 不能为空")
    @Schema(description = "路由id", requiredMode = Schema.RequiredMode.REQUIRED)
    private Long id;

    @NotNull(message = "pid 不能为空")
    @Schema(description = "父级路由id", requiredMode = Schema.RequiredMode.REQUIRED)
    private Long pid;

}
