package com.ark.center.iam.client.api.query;

import com.ark.center.iam.client.contants.ApiAuthType;
import com.ark.component.dto.PagingQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@Schema(
    description = "API查询参数",
    title = "API查询对象",
    example = """
            {
              "applicationId": 1,
              "categoryId": 1,
              "name": "用户查询",
              "status": 1,
              "authType": "ANONYMOUS"
            }
            """
)
public class ApiQuery extends PagingQuery {

    @Schema(
        description = "所属应用ID",
        example = "1",
        title = "应用ID"
    )
    private Long applicationId;

    @Schema(
        description = "API分类ID",
        example = "1",
        title = "分类ID"
    )
    private Long categoryId;

    @Schema(
        description = "API名称",
        example = "用户查询",
        title = "API名称"
    )
    private String name;

    @Schema(
        description = "状态：1-启用 2-禁用",
        example = "1",
        allowableValues = {"1", "2"},
        title = "API状态"
    )
    private Integer status;

    @Schema(
        description = "认证授权类型",
        example = "ANONYMOUS",
        enumAsRef = true,
        implementation = ApiAuthType.class,
        title = "认证授权类型"
    )
    private ApiAuthType authType;
}
