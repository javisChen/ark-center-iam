package com.ark.center.iam.client.api.command;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(name = "Api同步命令")
public class ApiSyncCmd {

    @Schema(description = "应用id", requiredMode = Schema.RequiredMode.NOT_REQUIRED)
    private Long applicationId;

}