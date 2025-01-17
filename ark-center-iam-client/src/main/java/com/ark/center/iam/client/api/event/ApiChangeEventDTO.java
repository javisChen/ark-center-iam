package com.ark.center.iam.client.api.event;

import com.ark.center.iam.client.api.enums.ApiChangeType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(
    description = "API变更事件消息",
    example = """
            {
              "apiId": 1,
              "changeType": "CREATED"
            }
            """
)
public class ApiChangeEventDTO {
    
    @Schema(description = "API ID", example = "1")
    private Long apiId;
    
    @Schema(
        description = "变更类型",
        example = "CREATED",
        enumAsRef = true,
        implementation = ApiChangeType.class
    )
    private ApiChangeType changeType;
} 