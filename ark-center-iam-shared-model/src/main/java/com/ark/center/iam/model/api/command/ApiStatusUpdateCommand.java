package com.ark.center.iam.model.api.command;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
@Schema(description = "启用/禁用Api命令")
public class ApiStatusUpdateCommand {

    @NotNull(message = "id不能为空")
    @Schema(description = "id")
    private Long id;

    @NotNull(message = "status不能为空")
    @Schema(description = "状态")
    private Integer status;

}