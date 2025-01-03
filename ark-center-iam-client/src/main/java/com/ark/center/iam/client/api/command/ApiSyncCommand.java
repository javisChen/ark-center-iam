package com.ark.center.iam.client.api.command;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(
    description = "Api同步命令",
    example = """
            {
              "applicationId": 1
            }
            """
)
public class ApiSyncCommand {

    @Schema(
        description = "应用id",
        example = "1",
        requiredMode = Schema.RequiredMode.NOT_REQUIRED
    )
    private Long applicationId;

}