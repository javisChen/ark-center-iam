package com.ark.center.iam.client.user.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Schema(
    description = "用户基础信息",
    title = "用户基础DTO",
    example = """
            {
              "id": 1,
              "username": "admin",
              "mobile": "13800138000",
              "userCode": "ADMIN",
              "isSuperAdmin": false,
              "status": 1,
              "createTime": "2024-01-01 12:00:00",
              "updateTime": "2024-01-01 12:00:00"
            }
            """
)
public class UserBaseDTO {

    @Schema(description = "用户ID", example = "1")
    private Long id;

    @Schema(description = "手机号", example = "13800138000")
    private String mobile;

    @Schema(description = "用户名", example = "admin")
    private String username;

    @Schema(description = "用户编码", example = "ADMIN")
    private String userCode;

    @Schema(description = "是否超级管理员", example = "false")
    private Boolean isSuperAdmin;

    @Schema(
        description = "状态：1-启用 2-禁用",
        example = "1",
        allowableValues = {"1", "2"}
    )
    private Integer status;

    @Schema(description = "创建时间", example = "2024-01-01 12:00:00")
    private LocalDateTime createTime;

    @Schema(description = "更新时间", example = "2024-01-01 12:00:00")
    private LocalDateTime updateTime;
}
