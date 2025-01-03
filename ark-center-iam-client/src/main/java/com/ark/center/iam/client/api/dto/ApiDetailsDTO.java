package com.ark.center.iam.client.api.dto;

import com.ark.center.iam.client.contants.ApiAuthType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(
    description = "API详情信息",
    title = "API详情DTO",
    example = """
            {
              "id": 1,
              "name": "查询用户信息",
              "uri": "/v1/users/{id}",
              "method": "GET",
              "applicationId": 1,
              "categoryId": 1,
              "authType": "ANONYMOUS",
              "hasPathVariable": true,
              "status": 1,
              "createTime": "2024-01-01 12:00:00",
              "updateTime": "2024-01-01 12:00:00",
              "permissionId": 1,
              "permissionCode": "USER:VIEW"
            }
            """
)
public class ApiDetailsDTO extends ApiBaseDTO {

    @Schema(description = "创建时间", example = "2024-01-01 12:00:00")
    private LocalDateTime createTime;

    @Schema(description = "更新时间", example = "2024-01-01 12:00:00")
    private LocalDateTime updateTime;

    @Schema(description = "权限ID", example = "1")
    private Long permissionId;

    @Schema(description = "权限编码", example = "USER:VIEW")
    private String permissionCode;
}
