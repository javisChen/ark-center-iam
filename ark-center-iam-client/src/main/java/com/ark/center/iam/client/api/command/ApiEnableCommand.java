package com.ark.center.iam.client.api.command;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
@Schema(
    description = "启用/禁用Api",
    example = """
            {
              "id": 1,
              "status": 1
            }
            """
)
public class ApiEnableCommand {

    @Schema(description = "API ID", example = "1")
    @NotNull(message = "id不能为空")
    private Long id;

    @Schema(
        description = "状态：1-启用 2-禁用",
        example = "1",
        allowableValues = {"1", "2"}
    )
    @NotNull(message = "status不能为空")
    private Integer status;

}