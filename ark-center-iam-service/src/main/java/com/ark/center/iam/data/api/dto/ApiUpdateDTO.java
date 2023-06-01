package com.ark.center.iam.data.api.dto;

import com.ark.component.validator.ValidateGroup;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.io.Serializable;

@Data
@Schema(name = "接口更新DTO")
public class ApiUpdateDTO implements Serializable {

    @NotNull(message = "id不能为空", groups = {ValidateGroup.Update.class})
    @Schema(name = "id")
    private Long id;

    @NotNull(message = "applicationId不能为空", groups = {ValidateGroup.Add.class})
    @Schema(name = "应用id")
    private Long applicationId;

    @NotNull(message = "categoryId不能为空", groups = {ValidateGroup.Add.class})
    @Schema(name = "分类id")
    private Long categoryId;

    @NotBlank(message = "name不能为空", groups = {ValidateGroup.Add.class})
    @Schema(name = "接口名称")
    private String name;

    @NotBlank(message = "url不能为空", groups = {ValidateGroup.Add.class})
    @Schema(name = "Url")
    private String url;

    @NotBlank(message = "method不能为空", groups = {ValidateGroup.Add.class})
    @Schema(name = "Http Method")
    private String method;

    @NotNull(message = "authType不能为空", groups = {ValidateGroup.Add.class})
    @Schema(name = "认证授权类型")
    private Integer authType;

    @NotNull(message = "status不能为空", groups = {ValidateGroup.Add.class})
    @Schema(name = "状态")
    private Integer status;

}