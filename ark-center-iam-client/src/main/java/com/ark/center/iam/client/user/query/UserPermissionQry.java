package com.ark.center.iam.client.user.query;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "用户权限查询请求")
public class UserPermissionQry {

    @Schema(description = "用户id")
    private Long userId;

    @Schema(description = "资源路径")
    private String requestUri;

    @Schema(description = "应用编号")
    private String applicationCode;

    @Schema(description = "HTTP Method")
    private String method;

}
