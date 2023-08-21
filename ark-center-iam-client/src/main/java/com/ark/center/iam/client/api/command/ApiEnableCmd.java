package com.ark.center.iam.client.api.command;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
@Schema(name = "启用/禁用Api")
public class ApiEnableCmd {

    @NotNull(message = "id不能为空")
    @Schema(name = "id")
    private Long id;

    @NotNull(message = "status不能为空")
    @Schema(name = "状态")
    private Integer status;

}