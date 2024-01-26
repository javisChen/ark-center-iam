package com.ark.center.iam.client.api.command;

import com.ark.component.ddd.app.Command;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
@Schema(description = "Api创建命令")
public class ApiCreateCommand implements Command {

    @NotNull(message = "id不能为空")
    @Min(value = 1L)
    @Schema(description = "id")
    private Long id;

    @NotNull(message = "applicationId不能为空")
    @Schema(description = "应用id")
    private Long applicationId;

    @NotNull(message = "categoryId不能为空")
    @Schema(description = "分类id")
    private Long categoryId;

    @NotBlank(message = "name不能为空")
    @Schema(description = "接口名称")
    private String name;

    @NotBlank(message = "uri不能为空")
    @Schema(description = "Uri")
    private String uri;

    @NotBlank(message = "method不能为空")
    @Schema(description = "Http Method")
    private String method;

    @NotNull(message = "authType不能为空")
    @Schema(description = "认证授权类型")
    private Integer authType;

    @NotNull(message = "status不能为空")
    @Schema(description = "状态")
    private Integer status;

}