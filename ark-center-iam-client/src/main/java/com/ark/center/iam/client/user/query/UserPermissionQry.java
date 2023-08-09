package com.ark.center.iam.client.user.query;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(name = "用户权限查询请求")
public class UserPermissionQry {

    @Schema(name = "用户id")
    private Long userId;

    @Schema(name = "资源路径")
    private String requestUri;

    @Schema(name = "应用编号")
    private String applicationCode;

    @Schema(name = "HTTP Method")
    private String method;

}
