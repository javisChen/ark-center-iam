package com.ark.center.iam.client.user.query;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(name = "用户权限查询请求")
public class UserPermissionQry {

    @Schema(name = "资源路径")
    private String requestUri;

    @Schema(name = "应用编号")
    private String applicationCode;

    @Schema(name = "HTTP方法")
    private String method;

    @Schema(name = "用户编号")
    private String userCode;

}
