package com.ark.center.iam.client.api.command;

import com.ark.component.validator.ValidateGroup;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
@Schema(description = "接口更新DTO")
public class ApiUpdateCmd  {

    @NotNull(message = "id不能为空", groups = {ValidateGroup.Update.class})
    @Min(value = 1L)
    @Schema(description = "id")
    private Long id;

    @NotNull(message = "applicationId不能为空", groups = {ValidateGroup.Add.class})
    @Schema(description = "应用id")
    private Long applicationId;

    @NotNull(message = "categoryId不能为空", groups = {ValidateGroup.Add.class})
    @Schema(description = "分类id")
    private Long categoryId;

    @NotBlank(message = "name不能为空", groups = {ValidateGroup.Add.class})
    @Schema(description = "接口名称")
    private String name;

    @NotBlank(message = "uri不能为空", groups = {ValidateGroup.Add.class})
    @Schema(description = "Uri")
    private String uri;

    @NotBlank(message = "method不能为空", groups = {ValidateGroup.Add.class})
    @Schema(description = "Http Method")
    private String method;

    @NotNull(message = "authType不能为空", groups = {ValidateGroup.Add.class})
    @Schema(description = "认证授权类型")
    private Integer authType;

    @NotNull(message = "status不能为空", groups = {ValidateGroup.Add.class})
    @Schema(description = "状态")
    private Integer status;

}