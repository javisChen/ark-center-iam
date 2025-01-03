package com.ark.center.iam.client.api.command;

import com.ark.center.iam.client.contants.ApiAuthType;
import com.ark.component.validator.ValidateGroup;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

@Data
@Schema(
    description = "API接口信息",
    title = "API接口命令",
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
              "status": 1
            }
            """
)
public class ApiCommand {

    @Schema(
        description = "API ID",
        requiredMode = Schema.RequiredMode.REQUIRED,
        example = "1",
        title = "API ID"
    )
    @NotNull(message = "id不能为空", groups = {ValidateGroup.Update.class})
    @Min(value = 1L, message = "非法的ID")
    private Long id;

    @Schema(
        description = "API名称",
        requiredMode = Schema.RequiredMode.REQUIRED,
        example = "查询用户信息",
        maxLength = 50,
        title = "API名称"
    )
    @NotBlank(message = "API名称不能为空", groups = {ValidateGroup.Add.class})
    @Length(max = 50, message = "API名称长度不能超过50")
    private String name;

    @Schema(
        description = "所属应用ID",
        requiredMode = Schema.RequiredMode.REQUIRED,
        example = "1",
        title = "应用ID"
    )
    @NotNull(message = "应用ID不能为空", groups = {ValidateGroup.Add.class})
    private Long applicationId;

    @Schema(
        description = "API分类ID",
        requiredMode = Schema.RequiredMode.REQUIRED,
        example = "1",
        title = "分类ID"
    )
    @NotNull(message = "分类ID不能为空", groups = {ValidateGroup.Add.class})
    private Long categoryId;

    @Schema(
        description = "接口URI",
        requiredMode = Schema.RequiredMode.REQUIRED,
        example = "/v1/users/{id}",
        maxLength = 200,
        title = "接口地址"
    )
    @NotBlank(message = "接口地址不能为空", groups = {ValidateGroup.Add.class})
    @Length(max = 200, message = "接口地址长度不能超过200")
    private String uri;

    @Schema(
        description = "HTTP方法",
        requiredMode = Schema.RequiredMode.REQUIRED,
        example = "GET",
        allowableValues = {"GET", "POST", "PUT", "DELETE", "PATCH"},
        title = "HTTP请求方法"
    )
    @NotBlank(message = "HTTP方法不能为空", groups = {ValidateGroup.Add.class})
    private String method;

    @Schema(
        description = "认证授权类型",
        requiredMode = Schema.RequiredMode.REQUIRED,
        example = "ANONYMOUS",
        enumAsRef = true,
        implementation = ApiAuthType.class,
        title = "认证授权类型"
    )
    @NotNull(message = "认证授权类型不能为空", groups = {ValidateGroup.Add.class})
    private ApiAuthType authType;

    @Schema(
        description = "是否包含路径参数",
        requiredMode = Schema.RequiredMode.REQUIRED,
        example = "true",
        title = "是否包含路径参数"
    )
    @NotNull(message = "请指定是否包含路径参数", groups = {ValidateGroup.Add.class})
    private Boolean hasPathVariable;

    @Schema(
        description = "状态：1-启用 2-禁用",
        requiredMode = Schema.RequiredMode.REQUIRED,
        example = "1",
        allowableValues = {"1", "2"},
        title = "API状态"
    )
    @NotNull(message = "状态不能为空", groups = {ValidateGroup.Add.class})
    private Integer status;
}