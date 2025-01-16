package com.ark.center.iam.client.api.dto;

import com.ark.center.iam.client.contants.ApiAuthType;
import lombok.Data;
import io.swagger.v3.oas.annotations.media.Schema;

/**
 * @title:
 * @desc:
 * @author: Javis
 */
@Data
@Schema(description = "API基础信息")
public class ApiDTO {

    @Schema(description = "API ID", example = "1")
    private Long id;

    @Schema(description = "API名称", example = "查询用户信息")
    private String name;

    @Schema(description = "接口URI", example = "/v1/users/{id}")
    private String uri;

    @Schema(description = "HTTP方法", example = "GET")
    private String method;

    @Schema(description = "所属应用ID", example = "1")
    private Long applicationId;

    @Schema(description = "API分类ID", example = "1")
    private Long categoryId;

    @Schema(
        description = "认证授权类型",
        example = "ANONYMOUS",
        enumAsRef = true,
        implementation = ApiAuthType.class
    )
    private ApiAuthType authType;

    @Schema(description = "是否动态路径", example = "true")
    private Boolean isDynamicPath;

    @Schema(
        description = "状态：1-启用 2-禁用",
        example = "1",
        allowableValues = {"1", "2"}
    )
    private Integer status;
}
