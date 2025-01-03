package com.ark.center.iam.client.api.dto;

import lombok.Data;
import io.swagger.v3.oas.annotations.media.Schema;

import java.time.LocalDateTime;

@Data
@Schema(
    description = "API分类基础信息",
    title = "API分类基础DTO",
    example = """
            {
              "id": 1,
              "name": "用户管理接口",
              "applicationId": 1,
              "sort": 1,
              "createTime": "2024-01-01 12:00:00",
              "updateTime": "2024-01-01 12:00:00"
            }
            """
)
public class ApiCategoryBaseDTO {

    @Schema(description = "分类ID", example = "1")
    private Long id;

    @Schema(description = "分类名称", example = "用户管理接口")
    private String name;

    @Schema(description = "所属应用ID", example = "1")
    private Long applicationId;

    @Schema(description = "排序号", example = "1")
    private Integer sort;

    @Schema(description = "创建时间", example = "2024-01-01 12:00:00")
    private LocalDateTime createTime;

    @Schema(description = "更新时间", example = "2024-01-01 12:00:00")
    private LocalDateTime updateTime;
}
