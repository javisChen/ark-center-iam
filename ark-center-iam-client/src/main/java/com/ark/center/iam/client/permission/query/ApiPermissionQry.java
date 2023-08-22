package com.ark.center.iam.client.permission.query;

import com.ark.component.dto.PagingQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class ApiPermissionQry extends PagingQuery {

    @Schema(description = "应用id")
    private Long applicationId;

    @Schema(description = "分类id")
    private Long categoryId;

    @Schema(description = "应用名称")
    private String name;

    @Schema(description = "状态 1-已上线；2-已下线", allowableValues = {"1", "2"})
    private Integer status;

    @Schema(description = "类型 1-业务系统（前后端）2-纯后台服务", allowableValues = {"1", "2"})
    private Integer type;

    @Schema(description = "认证授权类型 1-无需认证授权 2-只需认证无需授权 3-需要认证和授权", allowableValues = {"1", "2", "3"})
    private Integer authType;

}
