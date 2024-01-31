package com.ark.center.iam.model.permission.command;

import com.ark.component.ddd.app.Command;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
@Schema(description = "新增权限命令")
public class PermissionAddCommand implements Command {

    @NotNull(message = "资源id不能为空")
    @Schema(description = "资源id")
    private Long resourceId;

    @NotBlank(message = "code不能为空")
    @Size(max = 50)
    @Schema(description = "应用编码")
    private String code;

    @Schema(description = "状态 1-已上线；2-已下线")
    private Integer status;

    @Schema(description = "应用类型 1-业务系统（前后端）2-纯后台服务")
    private Integer type;

}