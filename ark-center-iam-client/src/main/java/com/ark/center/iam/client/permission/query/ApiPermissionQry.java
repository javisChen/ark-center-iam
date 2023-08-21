package com.ark.center.iam.client.permission.query;

import com.ark.component.dto.PagingQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class ApiPermissionQry extends PagingQuery {

    @Schema(name = "应用id")
    private Long applicationId;

    @Schema(name = "分类id")
    private Long categoryId;

    @Schema(name = "应用名称")
    private String name;

    @Schema(name = "状态", allowableValues = {"1", "2"}, description = "1-已上线；2-已下线")
    private Integer status;

    @Schema(name = "类型", allowableValues = {"1", "2"}, description = "1-业务系统（前后端）2-纯后台服务")
    private Integer type;

    @Schema(name = "认证授权类型", allowableValues = {"1", "2", "3"}, description = "1-无需认证授权 2-只需认证无需授权 3-需要认证和授权")
    private Integer authType;

}
